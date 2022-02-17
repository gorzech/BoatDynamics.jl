const m_total = m_B + m_RG + m_w + m_fs + m_k + 2m_t + 2m_f + 2m_s + 2m_OA # Masa łodzi i wioślarza
const m_move = m_w + m_k + 2m_t # masa w ruchu - wózek + bryła ciała + uda

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
    jt =
        l_s^2 * cos(F_0(θ_t))^2 +
        x_SB^2 +
        l_t^2 / 3 +
        l_t * l_s * cos(F_0(θ_t)) * cos(θ_t) +
        x_SB * l_t * cos(θ_t) +
        2x_SB * l_s * cos(F_0(θ_t))

    wltls = 2 # But in energy in matlab this is one
    jk =
        l_t^2 * cos(θ_t)^2 +
        l_s^2 * cos(F_0(θ_t))^2 +
        l_k^2 / 3 +
        x_SB^2 +
        wltls * l_t * l_s * cos(F_0(θ_t)) * cos(θ_t) - l_t * l_k * cos(θ_t) * cos(θ_k) +
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

    jjt =
        l_t^2 / 2 * cos(θ_t)^2 +
        l_s^2 * cos(F_0(θ_t))^2 +
        x_SB^2 +
        3l_t * l_s / 2 * cos(θ_t) * cos(F_0(θ_t)) +
        3x_SB * l_t / 2 * cos(θ_t) +
        2x_SB * l_s * cos(F_0(θ_t))

    (
        0.5m_total * (u^2 + w^2) +
        0.5J_By * θ′^2 +
        0.5m_move * (l_s * F_1(θ_t) + l_t)^2 * θ′_t^2 * sin(θ_t)^2 +
        0.5m_move * jt * (θ′ + θ′_t)^2 +
        0.5m_move * jk * (θ′ + θ′_k)^2 +
        (m_s + m_f + 0.5m_fs) * θ′^2 * x_SB^2 + # Tutaj tez w jednej z wersji jest 0.25 zamiast 0.5
        0.5m_RG * θ′^2 * x_OAB^2 + # czy to powinno tu być?
        m_s * (l_s^2 / 3 + x_SB^2 + x_SB * l_s * cos(F_0(θ_t))) * (θ′ - θ′_t * F_1(θ_t))^2 +
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
        (θ′ + θ′_k) +
        2m_t *
        (u * l_t / 2 * sin(θ_t) - w * (l_t / 2 * cos(θ_t) + l_s * cos(F_0(θ_t)) + x_SB)) *
        (θ′ + θ′_t) +
        2m_s *
        (u * l_s / 2 * sin(F_0(θ_t)) - w * (l_s / 2 * cos(F_0(θ_t)) + x_SB)) *
        (θ′ - θ′_t * F_1(θ_t)) -
        m_move * (l_t / 2 * cos(θ_t) + l_s * cos(F_0(θ_t)) + x_SB) * θ′ * w + # po dodaniu tego, otrzymywałem ujemne wartości energii kinetycznej
        m_k * jjk * θ′ * (θ′ + θ′_k) +
        2m_t * jjt * θ′ * (θ′ + θ′_t) +
        2m_s * x_SB * (l_s / 2 * cos(F_0(θ_t)) + x_SB) * θ′ * (θ′ - θ′_t * F_1(θ_t)) -
        m_t * l_t * (l_s * F_1(θ_t) + l_t) * θ′_t * (θ′ + θ′_t) * sin(θ_t)^2 -
        0.5m_k * l_k * (l_s * F_1(θ_t) + l_t) * θ′_t * (θ′ + θ′_k) * sin(θ_t) * sin(θ_k) -
        2(m_f + m_s + 0.5m_fs)x_SB * θ′ * w + m_RG * x_OAB * θ′ * w - # czy minus? w drugim wyrażeniu
        2m_OA * (y_OAB + (l_OAMX + l_OAMN) / 2 * sin(γ_OA)) * γ′_OA * u
    )
end

F_0(θ_t) = asin(l_t / l_s * sin(θ_t))
F_1(θ_t) = (l_t / l_s * cos(θ_t)) / (1 - (l_t / l_s * sin(θ_t))^2)^0.5
