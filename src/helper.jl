function bisectionMethodError(f, a, b, tol; maxiter = 1000) #f=@(x)x^2-3; a=1; b=2; (ensure change of sign between a and b) error=1e-4
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

const vh2o_0 = m / rhoh2o
find_bh2o(the) = (bh2o) -> vh2o_0 - vh2o(the, bh2o)
bh2o0(the) = bisectionMethodError(find_bh2o(the), zmax - hb, zmax, 1e-12) # (zmax=>bh2o=>zmax-hb)

function get_bh2o(z, θ, p)
    bh2o = p.bh2o_0 - z / cos(θ)
    # if bh2o < zmax - hb || bh2o > zmax
    #     @warn "bh2o value in boatode! out of range" bh2o
    # end
    return bh2o
end
