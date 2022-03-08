@testset "Use adaptive cubature to approximate boat mass" begin
    function hc_xonly(f, xmin, xmax)
        res = hquadrature(x -> f(x, bd.zmax-bd.hb), xmin, xmax)
        res[1]
    end
    function hc_limit(f, f_zlimit, xmin, xmax)
        function hcfun(u, Δ = 0.0)
            x, z = u
            if z > f_zlimit(x)
                0.0
            else
                f(x, z) + Δ
            end
        end
        a = SA[xmin, bd.zmax-bd.hb]
        b = SA[xmax, bd.zmax]
        # Compute by difference in volumes
        Δ = sqrt(eps())
        res1 = @test_nowarn hcubature(u -> hcfun(u, Δ / 2), a, b)
        res2 = @test_nowarn hcubature(u -> hcfun(u, -Δ / 2), a, b)
        (res1[1] - res2[1]) / Δ
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
    m_hull = 2 * (m_m_b + m_f_b + m_r_b) * bd.rhob * bd.deltab

    # poklad
    m_m_d = hc_xonly(bd.fi2m, bd.xmin0, bd.xmax0)
    m_f_d = hc_xonly(bd.fi2f, bd.xmax0, bd.xmax)
    m_r_d = hc_xonly(bd.fi2r, bd.xmin, bd.xmin0)
    m_deck_full = 2 * (m_m_d + m_f_d + m_r_d) * bd.rhod * bd.deltad
    m_deck_hole = -bd.rhod * bd.deltad * bd.bbe * (bd.xmaxe - bd.xmine)
    # podłoga
    m_ground = bd.rhog * bd.deltag * bd.bbg * (bd.xmaxg - bd.xming)

    m = m_hull + m_deck_full + m_deck_hole + m_ground
    @test m > 10 #≈ bd.m_B
end
