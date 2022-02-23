
function boatode!(dy, y, p, t)
    # y contains int(u,t), int(w, t), the - position level coordinates
    # as well as u, w, the1  - velocity level coordinates
    _, z, θ, u, w, θ′ = y

    γoa, γ′oa, γ′′oa = γ_OA(t), γ′_OA(t), γ′′_OA(t)
    θt, θ′t, θ′′t = θ_t(t), θ′_t(t), θ′′_t(t)
    θk, θ′k, θ′′k = θ_k(t), θ′_k(t), θ′′_k(t)
    bsp = Boat_sim_pars(get_bh2o(z, θ, p), γoa, γ′oa, θk, θ′k, θt, θ′t)
    # println(bsp)
    sθ, cθ = sincos(θ)
    R = SA[cθ sθ; -sθ cθ]
    U = SA[u, w]

    M = system_lhs(SA[θt, θk, γoa])
    b = system_rhs(SA[u, w, θ′, θt, θ′t, θ′′t, θk, θ′k, θ′′k, γoa, γ′oa, γ′′oa])
    F = Q(θ, u, w, bsp, t)

    dy[1:2] = R * U
    dy[3] = θ′
    dy[4:6] = M \ (b + F)
end

function solve_boat(;
    x0 = 0.0,
    z0 = 0.0,
    θ0 = 0.0,
    u0 = 0.0,
    w0 = 0.0,
    θ′0 = 0.0,
    t_end = 0.5,
)
    bh2o_0 = bh2o0(θ0)

    # Compute center of mass location to get consistent initial conditions
    M = system_lhs(SA[u0, w0, θ′0])
    z_CF = M[1, 3] / m
    x_CF = -M[2, 3] / m
    y0 = [x0, z0, θ0, u0 - θ′0 * z_CF, w0 + θ′0 * x_CF, θ′0]

    tspan = (0.0, t_end)
    prob = ODEProblem(boatode!, y0, tspan, (bh2o_0 = bh2o_0,))

    solve(prob, abstol = 1e-9, reltol = 1e-7, saveat = 0.01)
end
