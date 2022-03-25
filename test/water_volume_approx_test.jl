function water_line_z(x, bh2o, the)
    tt = tan(-the)
    x_W = bd.xo - bh2o / tt # x coordinate for water level in boat coordinate system
    (x - x_W) * tt # z coordinate of water level in boat coord system for given x
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
    z_limit_W(f_limit) = u -> (u[2] < water_line_z(u[1], bh2o, the) || f_limit(u))

    V_m_b = integrate_middle(flimit = z_limit_W(flimitm))
    V_f_b = integrate_front(flimit = z_limit_W(flimitf))
    V_r_b = integrate_rear(flimit = z_limit_W(flimitr))

    vh2o = 2(V_m_b + V_f_b + V_r_b)
    @test_broken bd.vh2o(the, bh2o) ≈ vh2o rtol = 1e-6
    @test bd.vh2ofn(the, bh2o) ≈ 2V_f_b rtol = 2e-2
    @test_broken bd.vh2om(the, bh2o) ≈ 2V_m_b rtol = 1e-6
    @test bd.vh2orn(the, bh2o) ≈ 2V_r_b rtol = 1e-3
end

@testset "Check if approximation of z1vh2o is correct" begin
    tol = eps()
    @test abs(bd.z1vh2o(0.0, bd.zmax - tol)) < tol
    
    z1v_max = bd.z1vh2o(0.0, 0.0)
    z1v_m = 2integrate_middle(u -> u[2] * fi2m(u))
    z1v_f = 2integrate_front(u -> u[2] * fi2f(u))
    z1v_r = 2integrate_rear(u -> u[2] * fi2r(u))
    @test z1v_max ≈ z1v_m + z1v_f + z1v_r rtol = 1e-5
    # compute for some bh2o value
    bh2o = 0.111245
    z1v_m = 2integrate_middle(u -> u[2] * fi2m(u); zmin = bh2o)
    z1v_f = 2integrate_front(u -> u[2] * fi2f(u); zmin = bh2o)
    z1v_r = 2integrate_rear(u -> u[2] * fi2r(u); zmin = bh2o)
    @test bd.z1vh2o(0.0, bh2o) ≈ z1v_m + z1v_f + z1v_r rtol = 1e-6

    bh2o = 0.05
    the = deg2rad(1)
    z_limit_W(f_limit) = u -> (u[2] < water_line_z(u[1], bh2o, the) || f_limit(u))

    z1v_m = 2integrate_middle(u -> u[2] * fi2m(u); flimit = z_limit_W(flimitm))
    z1v_f = 2integrate_front(u -> u[2] * fi2f(u); flimit = z_limit_W(flimitf))
    z1v_r = 2integrate_rear(u -> u[2] * fi2r(u); flimit = z_limit_W(flimitr))

    z1vh2o = z1v_m + z1v_f + z1v_r
    @test bd.z1vh2o(the, bh2o) ≈ z1vh2o rtol = 5e-4

    bh2o = 0.07
    the = -deg2rad(1)
    z1v_m = 2integrate_middle(u -> u[2] * fi2m(u); flimit = z_limit_W(flimitm))
    z1v_f = 2integrate_front(u -> u[2] * fi2f(u); flimit = z_limit_W(flimitf))
    z1v_r = 2integrate_rear(u -> u[2] * fi2r(u); flimit = z_limit_W(flimitr))

    z1vh2o = z1v_m + z1v_f + z1v_r
    @test bd.z1vh2o(the, bh2o) ≈ z1vh2o rtol = 5e-4
end

@testset "Check if approximation of x1vh2o is correct" begin
    tol = eps()
    @test abs(bd.x1vh2o(0.0, bd.zmax - tol)) < tol
    
    x1v_max = bd.x1vh2o(0.0, 0.0)
    x1v_m = 2integrate_middle(u -> u[1] * fi2m(u))
    x1v_f = 2integrate_front(u -> u[1] * fi2f(u))
    x1v_r = 2integrate_rear(u -> u[1] * fi2r(u))
    @test x1v_max ≈ x1v_m + x1v_f + x1v_r rtol = 1e-5
    # compute for some bh2o value
    bh2o = 0.111245
    x1v_m = 2integrate_middle(u -> u[1] * fi2m(u); zmin = bh2o)
    x1v_f = 2integrate_front(u -> u[1] * fi2f(u); zmin = bh2o)
    x1v_r = 2integrate_rear(u -> u[1] * fi2r(u); zmin = bh2o)
    @test bd.x1vh2o(0.0, bh2o) ≈ x1v_m + x1v_f + x1v_r rtol = 1e-6

    bh2o = 0.05
    the = deg2rad(1)
    z_limit_W(f_limit) = u -> (u[2] < water_line_z(u[1], bh2o, the) || f_limit(u))

    x1v_m = 2integrate_middle(u -> u[1] * fi2m(u); flimit = z_limit_W(flimitm))
    x1v_f = 2integrate_front(u -> u[1] * fi2f(u); flimit = z_limit_W(flimitf))
    x1v_r = 2integrate_rear(u -> u[1] * fi2r(u); flimit = z_limit_W(flimitr))

    x1vh2o = x1v_m + x1v_f + x1v_r
    @test bd.x1vh2o(the, bh2o) ≈ x1vh2o rtol = 1e-2

    bh2o = 0.07
    the = -deg2rad(1)
    x1v_m = 2integrate_middle(u -> u[1] * fi2m(u); flimit = z_limit_W(flimitm))
    x1v_f = 2integrate_front(u -> u[1] * fi2f(u); flimit = z_limit_W(flimitf))
    x1v_r = 2integrate_rear(u -> u[1] * fi2r(u); flimit = z_limit_W(flimitr))

    x1vh2o = x1v_m + x1v_f + x1v_r
    @test bd.x1vh2o(the, bh2o) ≈ x1vh2o rtol = 5e-4
end