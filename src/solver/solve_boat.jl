function solve_boat(
    t_end;
    x0 = 0.0,
    z0 = 0.0,
    θ0 = 0.0,
    u0 = 0.0,
    w0 = 0.0,
    θ′0 = 0.0,
    settings = Boat_settings(),
    dt::Union{Float64, Nothing} = nothing
)
    # "decode" settings
    p = Boat_ode_params(θ0, settings)

    # Compute center of mass location to get consistent initial conditions
    M = system_lhs(Boat_angles(p.angle_ranges, p.timing, 0.0))
    z_CF = M[1, 3] / m
    x_CF = -M[2, 3] / m
    y0 = [x0, z0, θ0, u0 - θ′0 * z_CF, w0 + θ′0 * x_CF, θ′0]


    tspan = (0.0, t_end)
    prob = ODEProblem(boatode!, y0, tspan, p)
    if dt === nothing
        solve(prob, abstol = 1e-9, reltol = 1e-7, saveat = 0.01)
    else
        solve(prob, SimpleRK4(), dt = dt)
    end
end