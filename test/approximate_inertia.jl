@testset "Use adaptive cubature to approximate boat mass" begin
    function hc_xonly(f, xmin, xmax)
        res = hquadrature(x -> f(x, bd.zmax-bd.hb), xmin, xmax)
        res[1]
    end
    function hc_limit(f, f_zlimit, xmin, xmax)
        @variables x, z
        f_sym = f(x, z)
        Dx = Differential(x)
        Dz = Differential(z)
        f_x_sym = expand_derivatives(Dx(f_sym))
        f_z_sym = expand_derivatives(Dz(f_sym))
        f_x = build_function(f_x_sym, [x, z], expression=Val{false})
        f_z = build_function(f_z_sym, [x, z], expression=Val{false})
        function hcfun(u, Δ = 0.0)
            _x, _z = u
            if _z > f_zlimit(_x)
                0.0
            else
                sqrt(
                    f_x(u)^2 + f_z(u)^2 + 1
                )
            end
        end
        a = SA[xmin, bd.zmax-bd.hb]
        b = SA[xmax, bd.zmax]
        res = @test_nowarn hcubature(u -> hcfun(u), a, b, maxevals=1_000)
        println(res[2])
        res[1]
    end
    # Start with the middle part
    hc_middle(f = bd.fi2m) = hc_limit(f, (x) -> bd.zmax, bd.xmin0, bd.xmax0)
    # dziob - psi2, fi2f
    hc_front(f = bd.fi2f) = hc_limit(f, bd.psi2, bd.xmax0, bd.xmax)
    # rufa - psi1, fi2r
    hc_rear(f = bd.fi2r) = hc_limit(f, bd.psi1, bd.xmin, bd.xmin0)

    # kadlub
    m_m_b = hc_middle(bd.fi2m)
    m_f_b = hc_front(bd.fi2f)
    m_r_b = hc_rear(bd.fi2r)
    snb = 2 * (m_m_b + m_f_b + m_r_b)
    m_hull = snb * bd.rhob * bd.deltab
    # @test snb ≈ bd.snb
    @test 2m_m_b ≈ bd.snbmv
    @test m_f_b ≈ bd.iinbfvv rtol=1e-3
    @test m_r_b ≈ bd.iinbrvv rtol=1e-3

    # poklad
    m_m_d = hc_xonly(bd.fi2m, bd.xmin0, bd.xmax0)
    m_f_d = hc_xonly(bd.fi2f, bd.xmax0, bd.xmax)
    m_r_d = hc_xonly(bd.fi2r, bd.xmin, bd.xmin0)
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
    @test m ≈ bd.m_B rtol=1e-3
end
