
function boatode!(dy, y, p, t)
    # y contains int(u,t), int(w, t), the - position level coordinates
    # as well as u, w, the1  - velocity level coordinates
    # xl = y[1]  #-  NOT USED
    zl = y[2]
    θ = y[3]
    u = y[4]
    w = y[5]
    θ′ = y[6]

    A = system_lhs([u, w, θ′])

    b = system_rhs([u, w, θ′, t])

    st, ct = sincos(θ)
    Tinv = [ct -st 0
        st ct 0
        0 0 1];
    dy[1:3] .= Tinv * y[4:6]
    dy[4:6] .= A \ b
end

function solve_boat()
    θ = 0.0
    θ′ = 0.0
    u = 0.0
    w = 0.0

    y0 = [0.0, 0, θ, u, w, θ′]
    tspan = (0.0, 0.5)
    prob = ODEProblem(boatode!, y0, tspan)

    solve(prob, abstol=1e-9, reltol = 1e-7, saveat = 0.02)
end