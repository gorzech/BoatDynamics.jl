function integrant_volume_to_surface_area(f)
    f_x(u) = ForwardDiff.derivative(x -> f(x, u[2]), u[1])
    f_z(u) = ForwardDiff.derivative(z -> f(u[1], z), u[2])
    u -> sqrt(f_x(u)^2 + f_z(u)^2 + 1)
end

function integrate_xontop(f, xmin, xmax)
    res = hquadrature(x -> f(SA[x, bd.zmax-bd.hb]), xmin, xmax)
    res[1]
end
function integrate_flimit(f, flimit; xmin, xmax, zmin = bd.zmax - bd.hb, zmax = bd.zmax)
    hcfun(u) =
        if flimit(u)
            0.0
        else
            f(u)
        end
    a = SA[xmin, zmin]
    b = SA[xmax, zmax]
    res = @test_nowarn hcubature(hcfun, a, b, maxevals = 1_000_000)
    # println(res[2])
    res[1]
end
fi2m(u) = bd.fi2m(u[1], u[2])
fi2f(u) = bd.fi2f(u[1], u[2])
fi2r(u) = bd.fi2r(u[1], u[2])
flimitm(u) = u[2] > bd.zmax
flimitf(u) = u[2] > bd.psi2(u[1])
flimitr(u) = u[2] > bd.psi1(u[1])
# Start with the middle part
integrate_middle(f = fi2m; flimit = flimitm, kwargs...) =
    integrate_flimit(f, flimit; xmin = bd.xmin0, xmax = bd.xmax0, kwargs...)
# dziob - psi2, fi2f
integrate_front(f = fi2f; flimit = flimitf, kwargs...) =
    integrate_flimit(f, flimit; xmin = bd.xmax0, xmax = bd.xmax, kwargs...)
# rufa - psi1, fi2r
integrate_rear(f = fi2r; flimit = flimitr, kwargs...) =
    integrate_flimit(f, flimit; xmin = bd.xmin, xmax = bd.xmin0, kwargs...)
