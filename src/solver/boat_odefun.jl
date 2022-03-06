# θ_t - kąt pomiędzy udem a osią x 0-45
# θ_k kąty pomiędzy tułowiem a osią x # 120 to 60
# kąty obrotu wiosla 30-120
struct Boat_settings
    γ_OA::Tuple{Float64,Float64}
    θ_t::Tuple{Float64,Float64}
    θ_k::Tuple{Float64,Float64}
    timing::Boat_timing
    x1va::Float64
    x1air::Float64
end

Boat_settings() =
    Boat_settings((30.0, 120.0), (22.5, 22.5), (90.0, 90.0), Boat_timing(), 0.0, 0.0)

function boatode!(dy, y, p, t)
    # y contains int(u,t), int(w, t), the - position level coordinates
    # as well as u, w, the1  - velocity level coordinates
    _, z, θ, u, w, θ′ = y

    bt = p.timing
    γoa, θt, θk = map(p.ranges) do r
        _angle(t, bt, r[1], r[2])
    end
    γ′oa, θ′t, θ′k = map(p.ranges) do r
        _angle′(t, bt, r[1], r[2])
    end
    γ′′oa, θ′′t, θ′′k = map(p.ranges) do r
        _angle′′(t, bt, r[1], r[2])
    end

    bsp = Boat_sim_pars(
        get_bh2o(z, θ, p),
        γoa,
        γ′oa,
        θk,
        θ′k,
        θt,
        θ′t,
        η(t, bt),
        p.x1va,
        p.x1air,
    )
    # println(bsp)
    sθ, cθ = sincos(θ)
    R = SA[cθ -sθ; sθ cθ]
    U = SA[u, w]

    M = system_lhs(SA[θt, θk, γoa])
    b = system_rhs(SA[u, w, θ′, θt, θ′t, θ′′t, θk, θ′k, θ′′k, γoa, γ′oa, γ′′oa])
    F = Q(θ, u, w, bsp)

    dy[1:2] = R * U
    dy[3] = θ′
    dy[4:6] = M \ (b + F)
end
function static_equilibrium(θ, settings::Boat_settings)
    (Q_g(
        θ,
        deg2rad(settings.γ_OA[1]),
        deg2rad(settings.θ_k[1]),
        deg2rad(settings.θ_t[1]),
    )+Q_BUOY(θ, bh2o0(θ)))[3]
end

function find_the0(themin, themax, settings::Boat_settings)
    bisectionMethod((the) -> static_equilibrium(the, settings), themin, themax, 1e-2)
end

function solve_boat(
    t_end;
    x0 = 0.0,
    z0 = 0.0,
    θ0 = 0.0,
    u0 = 0.0,
    w0 = 0.0,
    θ′0 = 0.0,
    settings = Boat_settings(),
)
    bh2o_0 = bh2o0(θ0)

    # Compute center of mass location to get consistent initial conditions
    M = system_lhs(SA[u0, w0, θ′0])
    z_CF = M[1, 3] / m
    x_CF = -M[2, 3] / m
    y0 = [x0, z0, θ0, u0 - θ′0 * z_CF, w0 + θ′0 * x_CF, θ′0]

    # "decode" settings
    timing = settings.timing
    ranges = map((settings.γ_OA, settings.θ_t, settings.θ_k)) do r
        deg2rad.(r)
    end
    p = (bh2o_0 = bh2o_0, timing = timing, ranges = ranges, x1va = settings.x1va, x1air = settings.x1air)

    tspan = (0.0, t_end)
    prob = ODEProblem(boatode!, y0, tspan, p)

    solve(prob, abstol = 1e-9, reltol = 1e-7, saveat = 0.01)
end
