const m = m_B + m_w + m_fs + 2m_f + 2m_s + 2m_t + m_k + m_RG + 2m_OA

function kinetic_energy(
    u,
    w,
    θ′,
    θ_t = θ_t,
    θ′_t = θ′_t,
    θ_k = θ_k,
    θ′_k = θ′_k,
    γ_OA = γ_OA,
    γ′_OA = γ′_OA,
)
    V_B0 = SA[u, w]

    V_RG = V_B0 + crossθ(θ′, r_RG)
    T_RG = 0.5 * dot(V_RG, V_RG) * m_RG

    V_w = V_B0 + r′_w(θ_t, θ′_t) + crossθ(θ′, r_w(θ_t))
    T_w = 0.5 * dot(V_w, V_w) * m_w

    V_f = V_B0 + crossθ(θ′, r_SB)
    T_fs = 0.5 * dot(V_f, V_f) * m_fs
    T_f = 0.5 * dot(V_f, V_f) * m_f

    V_s_const = V_B0 + crossθ(θ′, r_SB) + crossθ(θ′ - θ′_s(θ_t, θ′_t), r_s_const)
    V_s_∂l_s = crossθ(θ′ - θ′_s(θ_t, θ′_t), r_s_∂l_s(θ_t))
    T_s =
        0.5m_s * (
            dot(V_s_const, V_s_const) +
            2dot(V_s_const, V_s_∂l_s) * 0.5l_s +
            dot(V_s_∂l_s, V_s_∂l_s) * l_s^2 / 3
        )

    V_t_const =
        V_B0 + r′_w(θ_t, θ′_t) + crossθ(θ′, r_w(θ_t)) + crossθ(θ′, r_t_const(θ_t)) + crossθ(θ′_t, r_t_const(θ_t))
    V_t_∂l_t = crossθ(θ′ + θ′_t, r_t_∂l_t(θ_t))
    T_t =
        0.5m_t * (
            dot(V_t_const, V_t_const) +
            2dot(V_t_const, V_t_∂l_t) * 0.5l_t +
            dot(V_t_∂l_t, V_t_∂l_t) * l_t^2 / 3
        )

    V_k_const =
        V_B0 + r′_w(θ_t, θ′_t) + crossθ(θ′, r_w(θ_t)) + crossθ(θ′, r_k_const(θ_t)) + crossθ(θ′_k, r_k_const(θ_t))

    V_k_∂l_k = crossθ(θ′ + θ′_k, r_k_∂l_k(θ_k))
    T_k =
        0.5m_k * (
            dot(V_k_const, V_k_const) +
            2dot(V_k_const, V_k_∂l_k) * 0.5l_k +
            dot(V_k_∂l_k, V_k_∂l_k) * l_k^2 / 3
        )

    # V_OA = V_B0 +- γ′_OA x r_OA + θ′ x r_OA
    V_OA_XZ_const = V_B0 + SA[-γ′_OA*y_OA_const, 0]
    V_OA_XZ_∂l_OA = crossθ(θ′, SA[x_OA_∂l_OA(γ_OA), 0]) + SA[-γ′_OA*y_OA_∂l_OA(γ_OA), 0]
    V_OA_Y_∂l_OA = γ′_OA * x_OA_∂l_OA(γ_OA)
    V_OA_const = SA[V_OA_XZ_const[1], 0, V_OA_XZ_const[2]]
    V_OA_∂l_OA = SA[V_OA_XZ_∂l_OA[1], V_OA_Y_∂l_OA, V_OA_XZ_∂l_OA[2]]
    T_OA =
        0.5m_OA * (
            dot(V_OA_const, V_OA_const) +
            2dot(V_OA_const, V_OA_∂l_OA) * 0.5(l_OAMX + l_OAMN) +
            dot(V_OA_∂l_OA, V_OA_∂l_OA) * (l_OAMX^2 + l_OAMX * l_OAMN + l_OAMN^2) / 3
        )

    T_B = 0.5m_B * (u^2 + w^2) + 0.5J_By * θ′^2

    T_B + T_RG + T_w + T_fs + 2T_f + 2T_s + 2T_t + T_k + 2T_OA
end

