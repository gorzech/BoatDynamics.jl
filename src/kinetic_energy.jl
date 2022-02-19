const m_total = m_B + m_RG + m_k + 2m_OA # Masa łodzi i wioślarza
const m_move = m_k # masa w ruchu - wózek + bryła ciała + uda
const m = m_total + m_w + m_fs + 2m_f + 2m_s + 2m_t

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

    V_t_const = V_B0 + r′_w(θ_t, θ′_t) + crossθ(θ′, r_w(θ_t)) + crossθ(θ′ + θ′_t, r_t_const(θ_t))
    V_t_∂l_t = crossθ(θ′ + θ′_t, r_t_∂l_t(θ_t))
    T_t =
        0.5m_t * (
            dot(V_t_const, V_t_const) +
            2dot(V_t_const, V_t_∂l_t) * 0.5l_t +
            dot(V_t_∂l_t, V_t_∂l_t) * l_t^2 / 3
        )

    jt =
        l_s^2 * cos(F_0(θ_t))^2 +
        x_SB^2 +
        l_t^2 / 3 +
        l_t * l_s * cos(F_0(θ_t)) * cos(θ_t) +
        x_SB * l_t * cos(θ_t) +
        2x_SB * l_s * cos(F_0(θ_t))

    jk =
        l_t^2 * cos(θ_t)^2 +
        l_s^2 * cos(F_0(θ_t))^2 +
        l_k^2 / 3 +
        x_SB^2 +
        2l_t * l_s * cos(F_0(θ_t)) * cos(θ_t) - l_t * l_k * cos(θ_t) * cos(θ_k) +
        2x_SB * l_t * cos(θ_t) - l_s * l_k * cos(F_0(θ_t)) * cos(θ_k) +
        2x_SB * l_s * cos(F_0(θ_t)) - x_SB * l_k * cos(θ_k)

    jjk =
        l_t^2 * cos(θ_t)^2 +
        l_s^2 * cos(F_0(θ_t))^2 +
        x_SB^2 +
        2l_t * l_s * cos(θ_t) * cos(F_0(θ_t)) +
        2x_SB * l_t * cos(θ_t) +
        2x_SB * l_s * cos(F_0(θ_t)) - l_k * l_t / 2 * cos(θ_k) * cos(θ_t) -
        l_k * l_s / 2 * cos(θ_k) * cos(F_0(θ_t)) - x_SB * l_k / 2 * cos(θ_k)

    # Full
    (
        0.5m_total * (u^2 + w^2) +
        0.5J_By * θ′^2 +
        T_w +
        T_fs +
        2T_f +
        2T_s +
        2T_t +
        0.5m_move * (l_s * F_1(θ_t) + l_t)^2 * θ′_t^2 * sin(θ_t)^2 +
        0.5m_move * jt * (θ′ + θ′_t)^2 +
        0.5m_move * jk * (θ′ + θ′_k)^2 +
        0.5m_RG * θ′^2 * x_OAB^2 +
        m_OA *
        (
            (l_OAMX^2 + l_OAMX * l_OAMN + l_OAMN^2) / 3 +
            y_OAB^2 +
            y_OAB * (l_OAMX + l_OAMN) * sin(γ_OA)
        )γ′_OA^2 - m_move * (l_s * F_1(θ_t) + l_t)θ′_t * u * sin(θ_t) +
        m_k *
        (
            u * l_k / 2 * sin(θ_k) -
            w * (l_t * cos(θ_t) + l_s * cos(F_0(θ_t)) - l_k / 2 * cos(θ_k) + x_SB)
        ) *
        (θ′ + θ′_k) - m_move * (l_t / 2 * cos(θ_t) + l_s * cos(F_0(θ_t)) + x_SB) * θ′ * w + # po dodaniu tego, otrzymywałem ujemne wartości energii kinetycznej
        m_k * jjk * θ′ * (θ′ + θ′_k) -
        0.5m_k * l_k * (l_s * F_1(θ_t) + l_t) * θ′_t * (θ′ + θ′_k) * sin(θ_t) * sin(θ_k) -
        m_RG * x_OAB * θ′ * w -
        2m_OA * (y_OAB + (l_OAMX + l_OAMN) / 2 * sin(γ_OA)) * γ′_OA * u
    )
end

