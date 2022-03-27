@testset "Check if approximation of svbh2o is correct" begin
    tol = eps()
    @test abs(bd.svbh2o(0.0, bd.zmax - tol)) < 10tol
    # svbh2o(0.0, 0.0) - should be the full boat volume!
    SB_max = bd.svbh2o(0.0, 0.0)
    nbr = integrant_volume_to_surface_area(bd.fi2r)
    nbm = integrant_volume_to_surface_area(bd.fi2m)
    nbf = integrant_volume_to_surface_area(bd.fi2f)
    SB_max_m = 2integrate_middle(nbm)
    SB_max_f = 2integrate_front(nbf)
    SB_max_r = 2integrate_rear(nbr)
    @test SB_max ≈ SB_max_m + SB_max_f + SB_max_r rtol = 5e-5
    # compute for some bh2o value
    bh2o = 0.121245
    SB_m = integrate_middle(nbm; zmin = bh2o)
    SB_f = integrate_front(nbf; zmin = bh2o)
    SB_r = integrate_rear(nbr; zmin = bh2o)
    @test bd.svbh2o(0.0, bh2o) ≈ 2 * (SB_m + SB_f + SB_r) rtol = 5e-5

    bh2o = 0.05
    the = 0.5deg2rad(1)
    z_limit_W(f_limit) = u -> (u[2] < water_line_z(u[1], bh2o, the) || f_limit(u))

    SB_m = integrate_middle(nbm; flimit = z_limit_W(flimitm))
    SB_f = integrate_front(nbf; flimit = z_limit_W(flimitf))
    SB_r = integrate_rear(nbr; flimit = z_limit_W(flimitr))

    svbh2o = 2(SB_m + SB_f + SB_r)
    @test bd.svbh2o(the, bh2o) ≈ svbh2o rtol = 5e-3

    bh2o = 0.07
    the = -0.5deg2rad(1)

    SB_m = integrate_middle(nbm; flimit = z_limit_W(flimitm))
    SB_f = integrate_front(nbf; flimit = z_limit_W(flimitf))
    SB_r = integrate_rear(nbr; flimit = z_limit_W(flimitr))

    svbh2o = 2(SB_m + SB_f + SB_r)
    @test bd.svbh2o(the, bh2o) ≈ svbh2o rtol = 5e-3
    # @test bd.vh2ofn(the, bh2o) ≈ 2V_f_b rtol = 2e-2
    # @test bd.vh2om(the, bh2o) ≈ 2V_m_b rtol = 1e-4
    # @test bd.vh2orn(the, bh2o) ≈ 2V_r_b rtol = 1e-3
end