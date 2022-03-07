
struct Boat_ode_params
    bh2o_0::Float64
    angle_ranges::Boat_angle_ranges # in radians
    timing::Boat_timing
    x1va::Float64
    x1air::Float64
end

Boat_ode_params(θ0, bs::Boat_settings) =
    Boat_ode_params(bh2o0(θ0), deg2rad(bs.angle_ranges), bs.timing, bs.x1va, bs.x1air)

function Boat_sim_pars(z, θ, u, w, p, t)
    sθ, cθ = sincos(θ)
    R = SA[cθ -sθ; sθ cθ]
    U = SA[u, w]
    Boat_sim_pars(
        get_bh2o(z, θ, p),
        Boat_angles(p.angle_ranges, p.timing, t),
        η(t, p.timing),
        p.x1va,
        p.x1air,
        (R * U)...,
    )
end

function boatode!(dy, y, p::Boat_ode_params, t)
    # y contains int(u,t), int(w, t), the - position level coordinates
    # as well as u, w, the1  - velocity level coordinates
    _, z, θ, u, w, θ′ = y

    bsp = Boat_sim_pars(z, θ, u, w, p, t)

    M = system_lhs(bsp.boat_angles)
    b = system_rhs(u, w, θ′, bsp.boat_angles)
    F = Q(θ, bsp)

    dy[1] = bsp.x′
    dy[2] = bsp.z′
    dy[3] = θ′
    dy[4:6] = M \ (b + F)
end

function static_equilibrium(θ, settings::Boat_settings)
    (Q_g(
        θ,
        deg2rad(settings.angle_ranges.γ_OA[1]),
        deg2rad(settings.angle_ranges.θ_k[1]),
        deg2rad(settings.angle_ranges.θ_t[1]),
    )+Q_BUOY(θ, bh2o0(θ)))[3]
end

function find_the0(themin, themax, settings::Boat_settings)
    bisectionMethod((the) -> static_equilibrium(the, settings), themin, themax, 1e-2)
end
