function integrant_volume_to_surface_area(f)
    f_x(u) = ForwardDiff.derivative(x -> f(x, u[2]), u[1])
    f_z(u) = ForwardDiff.derivative(z -> f(u[1], z), u[2])
    u -> sqrt(f_x(u)^2 + f_z(u)^2 + 1)
end

function integrate_xontop(f, xmin, xmax)
    res = hquadrature(x -> f(SA[x, bd.zmax-bd.hb]), xmin, xmax)
    res[1]
end
function integrate_zlimit(f, f_zlimit; xmin, xmax, zmin = bd.zmax - bd.hb, zmax = bd.zmax)
    function hcfun(u)
        _x, _z = u
        _z > f_zlimit(_x) ? 0.0 : f(u)
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
# Start with the middle part
integrate_middle(f = fi2m; zlimit = (x) -> bd.zmax, kwargs...) =
    integrate_zlimit(f, zlimit; xmin = bd.xmin0, xmax = bd.xmax0, kwargs...)
# dziob - psi2, fi2f
integrate_front(f = fi2f; zlimit = bd.psi2, kwargs...) =
    integrate_zlimit(f, zlimit; xmin = bd.xmax0, xmax = bd.xmax, kwargs...)
# rufa - psi1, fi2r
integrate_rear(f = fi2r; zlimit = bd.psi1, kwargs...) =
    integrate_zlimit(f, zlimit; xmin = bd.xmin, xmax = bd.xmin0, kwargs...)

@testset "Use adaptive cubature to approximate boat mass" begin
    # kadlub
    m_m_b = integrate_middle(integrant_volume_to_surface_area(bd.fi2m))
    m_f_b = integrate_front(integrant_volume_to_surface_area(bd.fi2f))
    m_r_b = integrate_rear(integrant_volume_to_surface_area(bd.fi2r))
    snb = 2 * (m_m_b + m_f_b + m_r_b)
    m_hull = snb * bd.rhob * bd.deltab
    # @test snb ≈ bd.snb
    @test 2m_m_b ≈ bd.snbmv
    @test m_f_b ≈ bd.iinbfvv rtol = 1e-4
    @test m_r_b ≈ bd.iinbrvv rtol = 1e-4

    # poklad
    m_m_d = integrate_xontop(u -> bd.fi2m(u...), bd.xmin0, bd.xmax0)
    m_f_d = integrate_xontop(u -> bd.fi2f(u...), bd.xmax0, bd.xmax)
    m_r_d = integrate_xontop(u -> bd.fi2r(u...), bd.xmin, bd.xmin0)
    sbd = 2 * (m_m_d + m_f_d + m_r_d)
    sbde = bd.bbe * (bd.xmaxe - bd.xmine)
    m_deck_full = sbd * bd.rhod * bd.deltad
    m_deck_hole = bd.rhod * bd.deltad * sbde
    @test sbd ≈ bd.sbd
    @test sbde ≈ bd.sbde
    # podłoga
    sbdg = bd.bbg * (bd.xmaxg - bd.xming)
    m_ground = bd.rhog * bd.deltag * sbdg
    @test sbdg ≈ bd.sbdg

    m = m_hull + m_deck_full - m_deck_hole + m_ground
    @test m ≈ bd.m_B rtol = 1e-5
end

@testset "Use adaptive cubature to approximate boat static inertia sxmb" begin
    # kadlub
    sxfun(f) = u -> u[1] * f(u)
    sxfun_area(f) = sxfun(integrant_volume_to_surface_area(f))
    sx_m_b = integrate_middle(sxfun_area(bd.fi2m))
    sx_f_b = integrate_front(sxfun_area(bd.fi2f))
    sx_r_b = integrate_rear(sxfun_area(bd.fi2r))
    x1snb = 2 * (sx_m_b + sx_f_b + sx_r_b)
    sx_hull = x1snb * bd.rhob * bd.deltab
    # @test x1snb ≈ bd.x1snb
    @test 2sx_m_b ≈ bd.x1snbmv
    @test sx_f_b ≈ bd.ix1inbfvv rtol = 1e-3
    @test_broken sx_r_b ≈ bd.ix1inbrvv rtol = 1e-3

    # poklad
    sxfun2(f) = sxfun(u -> f(u[1], u[2]))
    sx_m_d = integrate_xontop(sxfun2(bd.fi2m), bd.xmin0, bd.xmax0)
    sx_f_d = integrate_xontop(sxfun2(bd.fi2f), bd.xmax0, bd.xmax)
    sx_r_d = integrate_xontop(sxfun2(bd.fi2r), bd.xmin, bd.xmin0)
    x1sbd = 2 * (sx_m_d + sx_f_d + sx_r_d)
    x1sbde = 2 * integrate_xontop(sxfun(u -> 0.5bd.bbe), bd.xmine, bd.xmaxe)
    sx_deck_full = x1sbd * bd.rhod * bd.deltad
    sx_deck_hole = x1sbde * bd.rhod * bd.deltad
    @test x1sbd ≈ bd.x1sbd
    @test x1sbde ≈ bd.x1sbde
    # podłoga
    x1sbdg = 2 * integrate_xontop(sxfun(u -> 0.5bd.bbg), bd.xming, bd.xmaxg)
    @test x1sbdg ≈ bd.x1sbdg
    sx_ground = bd.rhog * bd.deltag * x1sbdg

    sx = sx_hull + sx_deck_full - sx_deck_hole + sx_ground
    @test_broken sx ≈ bd.sxmb rtol = 1e-5
    # println((sx / bd.m_B, bd.xo))
end

@testset "Use adaptive cubature to approximate boat static inertia szmb" begin
    # kadlub
    szfun(f) = u -> u[2] * f(u)
    szfun_area(f) = szfun(integrant_volume_to_surface_area(f))
    sz_m_b = integrate_middle(szfun_area(bd.fi2m))
    sz_f_b = integrate_front(szfun_area(bd.fi2f))
    sz_r_b = integrate_rear(szfun_area(bd.fi2r))
    z1snb = 2 * (sz_m_b + sz_f_b + sz_r_b)
    sz_hull = z1snb * bd.rhob * bd.deltab
    @test 2sz_m_b ≈ bd.z1snbmnv
    @test sz_f_b ≈ bd.iz1inbfvv rtol = 8e-3
    @test sz_r_b ≈ bd.iz1inbrvv rtol = 1e-2

    # poklad
    m_m_d = integrate_xontop(u -> bd.fi2m(u...), bd.xmin0, bd.xmax0)
    m_f_d = integrate_xontop(u -> bd.fi2f(u...), bd.xmax0, bd.xmax)
    m_r_d = integrate_xontop(u -> bd.fi2r(u...), bd.xmin, bd.xmin0)
    sbd = 2 * (m_m_d + m_f_d + m_r_d)
    z1sbd = sbd * (bd.zmax - bd.hb)
    @test z1sbd ≈ bd.z1sbd
    z1sbde = bd.bbe * (bd.xmaxe - bd.xmine) * (bd.zmax - bd.hb)
    @test z1sbde ≈ bd.z1sbde
    sz_deck_full = z1sbd * bd.rhod * bd.deltad
    sz_deck_hole = bd.rhod * bd.deltad * z1sbde
    # podłoga
    z1sbdg = bd.bbg * (bd.xmaxg - bd.xming) * (bd.zmax - bd.hb + bd.zg)
    @test z1sbdg ≈ bd.z1sbdg
    sz_ground = bd.rhog * bd.deltag * z1sbdg

    sz = sz_hull + sz_deck_full - sz_deck_hole + sz_ground
    @test sz ≈ bd.szmb rtol = 5e-3
end

@testset "Use adaptive cubature to approximate boat static inertia j_By" begin
    # kadlub
    x2fun(f) = u -> u[1]^2 * f(u)
    z2fun(f) = u -> u[2]^2 * f(u)
    x2fun_area(f) = x2fun(integrant_volume_to_surface_area(f))
    z2fun_area(f) = z2fun(integrant_volume_to_surface_area(f))
    x2_m_b = integrate_middle(x2fun_area(bd.fi2m))
    x2_f_b = integrate_front(x2fun_area(bd.fi2f))
    x2_r_b = integrate_rear(x2fun_area(bd.fi2r))
    z2_m_b = integrate_middle(z2fun_area(bd.fi2m))
    z2_f_b = integrate_front(z2fun_area(bd.fi2f))
    z2_r_b = integrate_rear(z2fun_area(bd.fi2r))
    @test 2x2_m_b ≈ bd.x2snbmv
    @test x2_f_b ≈ bd.ix2inbfvv rtol = 4e-4
    @test_broken x2_r_b ≈ bd.ix2inbrvv rtol = 1e-2
    
    @test 2z2_m_b ≈ bd.z2snbmnv
    @test z2_f_b ≈ bd.iz2inbfvv rtol = 1e-2
    @test z2_r_b ≈ bd.iz2inbrvv rtol = 1e-2
    x2snb = 2 * (x2_m_b + x2_f_b + x2_r_b)
    z2snb = 2 * (z2_m_b + z2_f_b + z2_r_b)
    J_hull = (x2snb + z2snb) * bd.rhob * bd.deltab

    # poklad
    m_m_d = integrate_xontop(u -> bd.fi2m(u...), bd.xmin0, bd.xmax0)
    m_f_d = integrate_xontop(u -> bd.fi2f(u...), bd.xmax0, bd.xmax)
    m_r_d = integrate_xontop(u -> bd.fi2r(u...), bd.xmin, bd.xmin0)
    sbd = 2 * (m_m_d + m_f_d + m_r_d)
    z2sbd = sbd * (bd.zmax - bd.hb)^2
    @test z2sbd ≈ bd.z2sbd
    x2_m_d = integrate_xontop(u -> u[1]^2 * bd.fi2m(u...), bd.xmin0, bd.xmax0)
    x2_f_d = integrate_xontop(u -> u[1]^2 * bd.fi2f(u...), bd.xmax0, bd.xmax)
    x2_r_d = integrate_xontop(u -> u[1]^2 * bd.fi2r(u...), bd.xmin, bd.xmin0)
    x2sbd = 2 * (x2_m_d + x2_f_d + x2_r_d)
    @test x2sbd ≈ bd.x2sbd
    # poklad - dziura
    z2sbde = bd.bbe * (bd.xmaxe - bd.xmine) * (bd.zmax - bd.hb)^2
    @test z2sbde ≈ bd.z2sbde
    x2sbde = bd.bbe * (bd.xmaxe^3 - bd.xmine^3) / 3
    @test x2sbde ≈ bd.x2sbde
    J_deck_full = (x2sbd + z2sbd) * bd.rhod * bd.deltad
    J_deck_hole = bd.rhod * bd.deltad * (x2sbde + z2sbde)
    # podłoga
    x2sbdg = bd.bbg * (bd.xmaxg^3 - bd.xming^3) / 3
    z2sbdg = bd.bbg * (bd.xmaxg - bd.xming) * (bd.zmax - bd.hb + bd.zg)^2
    @test x2sbdg ≈ bd.x2sbdg
    @test z2sbdg ≈ bd.z2sbdg
    J_ground = bd.rhog * bd.deltag * (x2sbdg + z2sbdg)

    J_st = bd.m_B * (bd.xo^2 + bd.zo^2)
    J = J_hull + J_deck_full - J_deck_hole + J_ground - J_st
    @test_broken J ≈ bd.J_By rtol = 5e-3
    # println((J, bd.J_By))
end

@testset "Check if approximation of vh2o is correct" begin
    tol = eps()
    @test abs(bd.vh2o(0.0, bd.zmax - tol)) < tol
    # vh2o(0.0, 0.0) - should be the full boat volume!
    V_max = bd.vh2o(0.0, 0.0)
    V_max_m = 2integrate_middle()
    V_max_f = 2integrate_front()
    V_max_r = 2integrate_rear()
    @test V_max ≈ V_max_m + V_max_f + V_max_r rtol = 1e-6
    # compute for some bh2o value
    bh2o = 0.111245
    V_m_b = integrate_middle(zmin = bh2o)
    V_f_b = integrate_front(zmin = bh2o)
    V_r_b = integrate_rear(zmin = bh2o)
    @test bd.vh2o(0.0, bh2o) ≈ 2 * (V_m_b + V_f_b + V_r_b) rtol = 1e-6

    bh2o = 0.05
    the = deg2rad(1)
    # complement of the volume of the water
    x_W = bd.xo - bh2o / tan(-the) # x coordinate for water level in boat coordinate system
    z_W(x) = (x - x_W) * tan(-the) # z coordinate of water level in boat coord system for given x
    z_limit_W(f_limit) = x -> min(z_W(x), f_limit(x))

    cV_m_b = integrate_middle(
        zlimit = z_limit_W((x) -> bd.zmax)
    )
    # println(cV_m_b)
    # dziob - psi2, fi2f
    cV_f_b = integrate_zlimit(
        u -> bd.fi2f(u...),
        z_limit_W(bd.psi2);
        xmin = bd.xmax0,
        xmax = bd.xmax,
    )
    # println(cV_f_b)
    # rufa - psi1, fi2r
    cV_r_b = integrate_zlimit(
        u -> bd.fi2r(u...),
        z_limit_W(bd.psi1);
        xmin = bd.xmin,
        xmax = bd.xmin0,
    )
    # println(cV_r_b)
    vh2o = V_max - 2(cV_m_b + cV_f_b + cV_r_b)
    # println((vh2o, bd.vh2o(0.0, bh2o)))
    @test_broken bd.vh2o(the, bh2o) ≈ vh2o rtol = 1e-6
    @test bd.vh2ofn(the, bh2o) ≈ V_max_f - 2cV_f_b rtol = 1e-2
    @test_broken bd.vh2om(the, bh2o) ≈ V_max_m - 2cV_m_b rtol = 1e-6
    @test bd.vh2orn(the, bh2o) ≈ V_max_r - 2cV_r_b rtol = 1e-3
end
