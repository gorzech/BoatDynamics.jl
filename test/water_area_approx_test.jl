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
end

@testset "Check if approximation of szsvbh2o is correct" begin
    tol = eps()
    @test abs(bd.szsvbh2o(0.0, bd.zmax - tol)) < 10tol  
    # compensate from coordinate shift
    szsvbh2o(the, bh2o) = bd.szsvbh2o(the, bh2o) + bd.zo * bd.svbh2o(the, bh2o)
    Sz_SB_max = szsvbh2o(0.0, 0.0)
    z1nbr = u -> u[2] * integrant_volume_to_surface_area(bd.fi2r)(u)
    z1nbm = u -> u[2] * integrant_volume_to_surface_area(bd.fi2m)(u)
    z1nbf = u -> u[2] * integrant_volume_to_surface_area(bd.fi2f)(u)
    Sz_SB_max_m = 2integrate_middle(z1nbm)
    Sz_SB_max_f = 2integrate_front(z1nbf)
    Sz_SB_max_r = 2integrate_rear(z1nbr)
    @test Sz_SB_max ≈ Sz_SB_max_m + Sz_SB_max_f + Sz_SB_max_r rtol = 5e-3
    # compute for some bh2o value
    bh2o = 0.121245
    Sz_SB_m = integrate_middle(z1nbm; zmin = bh2o)
    Sz_SB_f = integrate_front(z1nbf; zmin = bh2o)
    Sz_SB_r = integrate_rear(z1nbr; zmin = bh2o)
    @test szsvbh2o(0.0, bh2o) ≈ 2 * (Sz_SB_m + Sz_SB_f + Sz_SB_r) rtol = 5e-3

    bh2o = 0.05
    the = 0.5deg2rad(1)
    z_limit_W(f_limit) = u -> (u[2] < water_line_z(u[1], bh2o, the) || f_limit(u))

    Sz_SB_m = integrate_middle(z1nbm; flimit = z_limit_W(flimitm))
    Sz_SB_f = integrate_front(z1nbf; flimit = z_limit_W(flimitf))
    Sz_SB_r = integrate_rear(z1nbr; flimit = z_limit_W(flimitr))

    vszsvbh2o = 2(Sz_SB_m + Sz_SB_f + Sz_SB_r)
    @test szsvbh2o(the, bh2o) ≈ vszsvbh2o rtol = 5e-3

    bh2o = 0.07
    the = -0.5deg2rad(1)

    Sz_SB_m = integrate_middle(z1nbm; flimit = z_limit_W(flimitm))
    Sz_SB_f = integrate_front(z1nbf; flimit = z_limit_W(flimitf))
    Sz_SB_r = integrate_rear(z1nbr; flimit = z_limit_W(flimitr))

    vszsvbh2o = 2(Sz_SB_m + Sz_SB_f + Sz_SB_r)
    @test szsvbh2o(the, bh2o) ≈ vszsvbh2o rtol = 5e-3
end

@testset "Check if approximation of sxsvbh2o is correct" begin
    tol = eps()
    @test abs(bd.sxsvbh2o(0.0, bd.zmax - tol)) < 10tol  
    # compensate from coordinate shift
    sxsvbh2o(the, bh2o) = bd.sxsvbh2o(the, bh2o) + bd.xo * bd.svbh2o(the, bh2o)
    Sx_SB_max = sxsvbh2o(0.0, 0.0)
    x1nbr = u -> u[1] * integrant_volume_to_surface_area(bd.fi2r)(u)
    x1nbm = u -> u[1] * integrant_volume_to_surface_area(bd.fi2m)(u)
    x1nbf = u -> u[1] * integrant_volume_to_surface_area(bd.fi2f)(u)
    Sx_SB_max_m = 2integrate_middle(x1nbm)
    Sx_SB_max_f = 2integrate_front(x1nbf)
    Sx_SB_max_r = 2integrate_rear(x1nbr)
    @test Sx_SB_max ≈ Sx_SB_max_m + Sx_SB_max_f + Sx_SB_max_r rtol = 5e-3
    # compute for some bh2o value
    bh2o = 0.121245
    Sx_SB_m = integrate_middle(x1nbm; zmin = bh2o)
    Sx_SB_f = integrate_front(x1nbf; zmin = bh2o)
    Sx_SB_r = integrate_rear(x1nbr; zmin = bh2o)
    @test sxsvbh2o(0.0, bh2o) ≈ 2 * (Sx_SB_m + Sx_SB_f + Sx_SB_r) rtol = 5e-3

    bh2o = 0.05
    the = 0.5deg2rad(1)
    z_limit_W(f_limit) = u -> (u[2] < water_line_z(u[1], bh2o, the) || f_limit(u))

    Sx_SB_m = integrate_middle(x1nbm; flimit = z_limit_W(flimitm))
    Sx_SB_f = integrate_front(x1nbf; flimit = z_limit_W(flimitf))
    Sx_SB_r = integrate_rear(x1nbr; flimit = z_limit_W(flimitr))

    vszsvbh2o = 2(Sx_SB_m + Sx_SB_f + Sx_SB_r)
    @test sxsvbh2o(the, bh2o) ≈ vszsvbh2o rtol = 5e-3

    bh2o = 0.07
    the = -0.5deg2rad(1)

    Sx_SB_m = integrate_middle(x1nbm; flimit = z_limit_W(flimitm))
    Sx_SB_f = integrate_front(x1nbf; flimit = z_limit_W(flimitf))
    Sx_SB_r = integrate_rear(x1nbr; flimit = z_limit_W(flimitr))

    vszsvbh2o = 2(Sx_SB_m + Sx_SB_f + Sx_SB_r)
    @test sxsvbh2o(the, bh2o) ≈ vszsvbh2o rtol = 5e-3
end