function bisectionMethodError(f, a, b, tol; maxiter = 200) #f=@(x)x^2-3; a=1; b=2; (ensure change of sign between a and b) error=1e-4
    c = (a + b) / 2
    ftry(x) =
        try
            f(x)
        catch
            1.0
        end

    iter = 1
    while abs(ftry(c)) > tol
        if ftry(c) < 0 && ftry(a) < 0
            a = c
        else
            b = c
        end
        c = (a + b) / 2
        iter += 1
        iter < maxiter || throw(DomainError("Maximum number of iterations reached in bisectionMethodError $iter."))
    end
    return c
end

const vh2o_0 = m_total / rhoh2o
find_bh2o(the) = (bh2o) -> vh2o_0 - vh2o(the, bh2o)
bh2o0(the) = bisectionMethodError(find_bh2o(the), zmax - hb + 1e-10, zmax - 1e-10, 1e-10) # (zmax=>bh2o=>zmax-hb)

function boatode!(dy, y, p, t)
    # y contains int(u,t), int(w, t), the - position level coordinates
    # as well as u, w, the1  - velocity level coordinates
    # xl = y[1]  #-  NOT USED
    zl = y[2]
    θ = y[3]
    u = y[4]
    w = y[5]
    θ′ = y[6]

    A = system_lhs(SA[u, w, θ′])

    b = system_rhs(SA[u, w, θ′, t])

    st, ct = sincos(θ)
    Tinv = [
        ct -st 0
        st ct 0
        0 0 1
    ]

    dy[1:3] .= Tinv * y[4:6]
    dy[4:6] .= A \ b
end

function solve_boat(; x0 = 0.0, z0 = 0.0, θ0 = 0.0, u0 = 0.0, w0 = 0.0, θ′0 = 0.0, t_end = 0.5)
    y0 = [x0, z0, θ0, u0, w0, θ′0]
    tspan = (0.0, t_end)
    prob = ODEProblem(boatode!, y0, tspan)

    solve(prob, abstol = 1e-9, reltol = 1e-7, saveat = 0.02)
end
