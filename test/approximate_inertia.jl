function integrant_volume_to_surface_area(f)
    f_x(u) = ForwardDiff.derivative(x -> f(x, u[2]), u[1])
    f_z(u) = ForwardDiff.derivative(z -> f(u[1], z), u[2])
    u -> sqrt(f_x(u)^2 + f_z(u)^2 + 1)
end

function hc_xonly(f, xmin, xmax)
    res = hquadrature(x -> f(SA[x, bd.zmax-bd.hb]), xmin, xmax)
    res[1]
end
function hc_limit(f, f_zlimit, xmin, xmax)
    function hcfun(u)
        _x, _z = u
        _z > f_zlimit(_x) ? 0.0 : f(u)
    end
    a = SA[xmin, bd.zmax-bd.hb]
    b = SA[xmax, bd.zmax]
    res = @test_nowarn hcubature(hcfun, a, b, maxevals = 1_000_000)
    println(res[2])
    res[1]
end
# Start with the middle part
hc_middle(f = bd.fi2m) = hc_limit(f, (x) -> bd.zmax, bd.xmin0, bd.xmax0)
# dziob - psi2, fi2f
hc_front(f = bd.fi2f) = hc_limit(f, bd.psi2, bd.xmax0, bd.xmax)
# rufa - psi1, fi2r
hc_rear(f = bd.fi2r) = hc_limit(f, bd.psi1, bd.xmin, bd.xmin0)

@testset "Use adaptive cubature to approximate boat mass" begin
    # kadlub
    m_m_b = hc_middle(integrant_volume_to_surface_area(bd.fi2m))
    m_f_b = hc_front(integrant_volume_to_surface_area(bd.fi2f))
    m_r_b = hc_rear(integrant_volume_to_surface_area(bd.fi2r))
    snb = 2 * (m_m_b + m_f_b + m_r_b)
    m_hull = snb * bd.rhob * bd.deltab
    # @test snb ≈ bd.snb
    @test 2m_m_b ≈ bd.snbmv
    @test m_f_b ≈ bd.iinbfvv rtol = 1e-4
    @test m_r_b ≈ bd.iinbrvv rtol = 1e-4

    # poklad
    m_m_d = hc_xonly(u -> bd.fi2m(u...), bd.xmin0, bd.xmax0)
    m_f_d = hc_xonly(u -> bd.fi2f(u...), bd.xmax0, bd.xmax)
    m_r_d = hc_xonly(u -> bd.fi2r(u...), bd.xmin, bd.xmin0)
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
    sx_m_b = hc_middle(sxfun_area(bd.fi2m))
    sx_f_b = hc_front(sxfun_area(bd.fi2f))
    sx_r_b = hc_rear(sxfun_area(bd.fi2r))
    x1snb = 2 * (sx_m_b + sx_f_b + sx_r_b)
    sx_hull = x1snb * bd.rhob * bd.deltab
    # @test x1snb ≈ bd.x1snb
    @test 2sx_m_b ≈ bd.x1snbmv
    @test sx_f_b ≈ bd.ix1inbfvv rtol = 1e-3
    @test sx_r_b ≈ bd.ix1inbrvv rtol = 1e-3

    # poklad
    sxfun2(f) = sxfun(u -> f(u[1], u[2]))
    sx_m_d = hc_xonly(sxfun2(bd.fi2m), bd.xmin0, bd.xmax0)
    sx_f_d = hc_xonly(sxfun2(bd.fi2f), bd.xmax0, bd.xmax)
    sx_r_d = hc_xonly(sxfun2(bd.fi2r), bd.xmin, bd.xmin0)
    x1sbd = 2 * (sx_m_d + sx_f_d + sx_r_d)
    x1sbde = 0.5bd.bbe * (bd.xmaxe - bd.xmine)^2
    sx_deck_full = x1sbd * bd.rhod * bd.deltad
    sx_deck_hole = bd.rhod * bd.deltad * x1sbde
    @test x1sbd ≈ bd.x1sbd
    @test x1sbde ≈ bd.x1sbde
    # podłoga
    x1sbdg = 0.5bd.bbg * (bd.xmaxg - bd.xming)^2
    sx_ground = bd.rhog * bd.deltag * x1sbdg
    @test x1sbdg ≈ bd.x1sbdg

    sx = sx_hull + sx_deck_full - sx_deck_hole + sx_ground
    @test sx ≈ bd.sxmb rtol = 1e-5
    println((sx / bd.m_B, bd.xo))
end

@testset "Use adaptive cubature to approximate boat static inertia szmb" begin
    # kadlub
    szfun(f) = u -> u[2] * f(u)
    szfun_area(f) = szfun(integrant_volume_to_surface_area(f))
    sz_m_b = hc_middle(szfun_area(bd.fi2m))
    sz_f_b = hc_front(szfun_area(bd.fi2f))
    sz_r_b = hc_rear(szfun_area(bd.fi2r))
    z1snb = 2 * (sz_m_b + sz_f_b + sz_r_b)
    sz_hull = z1snb * bd.rhob * bd.deltab
    # @test x1snb ≈ bd.x1snb
    @test 2sz_m_b ≈ bd.z1snbmnv
    @test sz_f_b ≈ bd.iz1inbfvv rtol = 1e-2
    @test sz_r_b ≈ bd.iz1inbrvv rtol = 1e-2

    # poklad
    m_m_d = hc_xonly(u -> bd.fi2m(u...), bd.xmin0, bd.xmax0)
    m_f_d = hc_xonly(u -> bd.fi2f(u...), bd.xmax0, bd.xmax)
    m_r_d = hc_xonly(u -> bd.fi2r(u...), bd.xmin, bd.xmin0)
    sbd = 2 * (m_m_d + m_f_d + m_r_d)
    z1sbd = sbd * (bd.zmax-bd.hb)
    @test z1sbd ≈ bd.z1sbd
    z1sbde = bd.bbe * (bd.xmaxe - bd.xmine) * (bd.zmax-bd.hb)
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
