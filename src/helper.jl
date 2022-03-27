function bisectionMethod(f, a, b, tol; maxiter = 1000) #f=@(x)x^2-3; a=1; b=2; (ensure change of sign between a and b) error=1e-4
    if sign(f(a)) == sign(f(b))
        throw(DomainError("Function has the same sign on both ends in bisectionMethod."))
    end
    c = (a + b) / 2

    _fc = f(c)
    _fa = f(a)
    iter = 1
    while abs(_fc) > tol
        if _fc < 0 && _fa < 0 || _fc > 0 && _fa > 0
            a = c
            _fa = _fc
        else
            b = c
        end
        c = (a + b) / 2
        _fc = f(c)
        iter += 1
        iter < maxiter || throw(
            DomainError("Maximum number of iterations reached in bisectionMethod $iter"),
        )
    end
    return c
end

function bisectionMethodError(f, a, b, tol; maxiter = 1000) #f=@(x)x^2-3; a=1; b=2; (ensure change of sign between a and b) error=1e-4
    c = (a + b) / 2
    ftry(x) =
        try
            f(x)
        catch
            1.0
        end

    bisectionMethod(ftry, a, b, tol; maxiter = maxiter)
end

const vh2o_0 = m / rhoh2o
find_bh2o(the) = (bh2o) -> vh2o_0 - vh2o(the, bh2o)
bh2o0(the) = bisectionMethodError(find_bh2o(the), zmax - hb, zmax, 1e-6) # (zmax=>bh2o=>zmax-hb)

function get_bh2o(z, θ, p)
    B0 = cos(p.θ0) * (p.bh2o_0 - zo)
    bh2o = (B0 - z) / cos(θ) + zo
    # bh2o = p.bh2o_0 - z / cos(θ)
    # if bh2o < zmax - hb || bh2o > zmax
    #     @warn "bh2o value in boatode! out of range" bh2o
    # end
    return bh2o
end
