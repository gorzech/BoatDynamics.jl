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

γ_OA(t, bt) = _angle(t, bt, γ_OA_min, γ_OA_max)
γ′_OA(t, bt) = _angle′(t, bt, γ_OA_min, γ_OA_max)
γ′′_OA(t, bt) = _angle′′(t, bt, γ_OA_min, γ_OA_max)

θ_k(t, bt) = _angle(t, bt, θ_k_min, θ_k_max)
θ′_k(t, bt) = _angle′(t, bt, θ_k_min, θ_k_max)
θ′′_k(t, bt) = _angle′′(t, bt, θ_k_min, θ_k_max)

θ_t(t, bt) = _angle(t, bt, θ_t_min, θ_t_max)
θ′_t(t, bt) = _angle′(t, bt, θ_t_min, θ_t_max)
θ′′_t(t, bt) = _angle′′(t, bt, θ_t_min, θ_t_max)
