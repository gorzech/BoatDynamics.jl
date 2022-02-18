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
        iter < maxiter || throw(
            DomainError(
                "Maximum number of iterations reached in bisectionMethodError $iter.",
            ),
        )
    end
    return c
end

const vh2o_0 = m_total / rhoh2o
find_bh2o(the) = (bh2o) -> vh2o_0 - vh2o(the, bh2o)
bh2o0(the) = bisectionMethodError(find_bh2o(the), zmax - hb + 1e-10, zmax - 1e-10, 1e-10) # (zmax=>bh2o=>zmax-hb)

function get_bh2o(z, θ, p)
    bh2o = p.bh2o_0 - z / cos(θ)
    if bh2o < zmax - hb || bh2o > zmax
        @warn "bh2o value in boatode! out of range" bh2o
    end
    return bh2o
end

function boatode!(dy, y, p, t)
    # y contains int(u,t), int(w, t), the - position level coordinates
    # as well as u, w, the1  - velocity level coordinates
    x, z, θ, u, w, θ′ = y

    # bh2o = get_bh2o(zl, θ, p)
    sθ, cθ = sincos(θ)
    R = SA[cθ sθ; -sθ cθ]
    U = SA[u, w]

    M = system_lhs(SA[u, w, θ′])
    b = system_rhs(SA[u, w, θ′, t])
    F = SA[0.0, 0.0, 0.0] # Q(θ, 0.0)

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
    z_CF = M[1, 3] / m_total
    x_CF = -M[2, 3] / m_total
    y0 = [x0, z0, θ0, u0 - θ′0 * z_CF, w0 + θ′0 * x_CF, θ′0]
    
    tspan = (0.0, t_end)
    prob = ODEProblem(boatode!, y0, tspan, (bh2o_0 = bh2o_0,))

    solve(prob, abstol = 1e-9, reltol = 1e-7, saveat = 0.01)
end
