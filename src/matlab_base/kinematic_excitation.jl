struct Boat_timing
    T_in::Float64
    T_out::Float64
    T_1::Float64
    T_2::Float64
    T_t::Float64
end

# T_1 = 2 * (0.7 + T_in + T_out)
Boat_timing(T_active, T_passive) =
    Boat_timing(0, 0, 2T_active, 2T_passive, T_active + T_passive)

Boat_timing() = Boat_timing(0.7, 0.5)

struct Boat_angle_ranges
    γ_OA::Tuple{Float64,Float64}
    θ_t::Tuple{Float64,Float64}
    θ_k::Tuple{Float64,Float64}
end

Boat_angle_ranges() = Boat_angle_ranges((30.0, 120.0), (22.5, 22.5), (90.0, 90.0))

function Base.deg2rad(angles::Boat_angle_ranges)
    Boat_angle_ranges(deg2rad.(angles.γ_OA), deg2rad.(angles.θ_t), deg2rad.(angles.θ_k))
end

struct Boat_angles
    γ_OA::Float64
    θ_t::Float64
    θ_k::Float64
    γ′_OA::Float64
    θ′_t::Float64
    θ′_k::Float64
    γ′′_OA::Float64
    θ′′_t::Float64
    θ′′_k::Float64
end

function Boat_angles(angle_ranges::Boat_angle_ranges, bt::Boat_timing, t)
    aranges = angle_ranges.γ_OA, angle_ranges.θ_t, angle_ranges.θ_k
    γoa, θt, θk = map(aranges) do r
        _angle(t, bt, r[1], r[2])
    end
    γ′oa, θ′t, θ′k = map(aranges) do r
        _angle′(t, bt, r[1], r[2])
    end
    γ′′oa, θ′′t, θ′′k = map(aranges) do r
        _angle′′(t, bt, r[1], r[2])
    end
    Boat_angles(γoa, θt, θk, γ′oa, θ′t, θ′k, γ′′oa, θ′′t, θ′′k)
end

Boat_angles() = Boat_angles(deg2rad(Boat_angle_ranges()), Boat_timing(), 0.0)

t_periodic(t, bt::Boat_timing) = mod(t, bt.T_t)

function η(t, bt::Boat_timing)
    # to - czas w danym okresie
    to = t_periodic(t, bt)

    if to < bt.T_in
        to / bt.T_in
    elseif to < 0.5bt.T_1 - bt.T_out
        one(t)
    elseif to < 0.5bt.T_1
        1 - (to - 0.5bt.T_1 + bt.T_out) / bt.T_out
    else
        zero(t)
    end
end

function kpars(to, bt::Boat_timing)
    #KPARS Helper to get phase parameters.
    k1 = to <= 0.5bt.T_1
    (k1, !k1) .* 1
end

function _angle(t, bt::Boat_timing, vmin, vmax)
    to = t_periodic(t, bt)
    k1, k2 = kpars(to, bt)
    T_1, T_2 = bt.T_1, bt.T_2
    0.5(vmax + vmin) -
    0.5(vmax - vmin) * (k1 * cospi(2to / T_1) - k2 * cospi(2(to - 0.5T_1) / T_2))
end

function _angle′(t, bt::Boat_timing, vmin, vmax)
    to = t_periodic(t, bt)
    k1, k2 = kpars(to, bt)
    T_1, T_2 = bt.T_1, bt.T_2
    -π *
    ((k2 * sinpi(2(T_1 / 2 - to) / T_2)) / T_2 + (k1 * sinpi(2to / T_1)) / T_1) *
    (vmin - vmax)
end

function _angle′′(t, bt::Boat_timing, vmin, vmax)
    to = t_periodic(t, bt)
    k1, k2 = kpars(to, bt)
    T_1, T_2 = bt.T_1, bt.T_2
    2π^2 *
    (k2 * cospi(2(T_1 / 2 - to) / T_2) / T_2^2 - k1 * cospi(2to / T_1) / T_1^2) *
    (vmin - vmax)
end
