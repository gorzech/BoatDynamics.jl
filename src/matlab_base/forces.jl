struct Boat_sim_pars
    bh2o::Float64
    boat_angles::Boat_angles
    η::Float64
    x1va::Float64
    x1air::Float64
    x′::Float64
    z′::Float64
end

function Q(θ, bsp::Boat_sim_pars)
    x1va, x1air, x′, ba = bsp.x1va, bsp.x1air, bsp.x′, bsp.boat_angles
    Q_g(θ, ba.γ_OA, ba.θ_k, ba.θ_t) +
    Q_BUOY(θ, bsp.bh2o) +
    Q_VA(θ, x′, bsp.bh2o, x1va) +
    Q_AE(θ, x′, bsp.bh2o, x1air) +
    Q_ROAE(θ, x′, x1air, ba.θ_t, ba.θ′_t) +
    Q_T(θ, x′, x1va, ba.γ_OA, ba.γ′_OA, bsp.η)
end

function Q_g(θ, γ_OA, θ_k, θ_t)
    sθ, cθ = sincos(θ)
    Xg = m * g * sθ
    Zg = m * g * cθ
    Mg_RG = m_RG * g * r_RG[1] * cθ
    Mg_w = m_w * g * x_w(θ_t) * cθ
    Mg_fs = m_fs * g * x_SB * cθ
    Mg_f = m_f * g * x_SB * cθ
    Mg_k = m_k * g * dot(r_w(θ_t) + r_k_const(θ_t) + 0.5l_k * r_k_∂l_k(θ_k), SA[cθ, -sθ])
    Mg_t =
        m_t * g * ((-0.5l_t * cos(θ_t) + 2x_w(θ_t)) * cos(θ) - 0.5l_t * sin(θ_t) * sθ)
    Mg_s =
        m_s * g * ((0.5l_s * cos(F_0(θ_t)) + 2x_SB) * cos(θ) - 0.5l_t * sin(θ_t) * sθ)
    # Here is also a difference
    Mg_OA = m_OA * g * 0.5(l_OAMX + l_OAMN) * x_OA_∂l_OA(γ_OA) * cθ
    # moa * g * (loamx + loamn) * cos(gamoa) * (cos(θ) + sin(θ))
    @debug "Mg parts are as follows: " Mg_RG Mg_w Mg_fs Mg_f Mg_k Mg_t Mg_s Mg_OA
    Mg = Mg_RG + Mg_w + Mg_fs + 2Mg_f + Mg_k + 2Mg_t + 2Mg_s + 2Mg_OA
    SA[Xg, Zg, Mg]
end

function Q_BUOY(θ, bh2o)
    F_BUOY = -rhoh2o * g * vh2o(θ, bh2o)
    X = F_BUOY * sin(θ)
    Z = F_BUOY * cos(θ)
    M_BUOY = -rhoh2o * g * (szvh2o(θ, bh2o) * sin(θ) + sxvh2o(θ, bh2o) * cos(θ))
    SA[X, Z, M_BUOY]
end

function Q_VA(θ, x1b, bh2o, x1va)
    x1 = x1b - x1va
    sx1 = sign(x1)
    coeff = 0.5rhoh2o * x1^2 * sx1

    R_SHAPE = coeff * cdx * tvmh2o(θ) / cos(θ)
    R_VIS = coeff * cf0 * svbh2o(θ, bh2o) * freh2o
    R_VAVE = coeff * cdw * yth2ov(θ, bh2o)
    R_VA = R_SHAPE + R_VIS + R_VAVE
    X_VA = -R_VA * cos(θ)
    Z_VA = R_VA * sin(θ)
    M_SHAPE = -coeff * cdx * sztvmh2o(θ, bh2o) ./ cos(θ)
    M_VIS = -coeff * cf0 * (szsvbh2o(θ, bh2o) * cos(θ) - sxsvbh2o(θ, bh2o) * sin(θ)) * freh2o
    M_VAVE = -coeff * cdw * (z1yth2ov(θ, bh2o) * cos(θ) - x1yth2ov(θ, bh2o) * sin(θ))
    M_VA = M_SHAPE + M_VIS + M_VAVE
    SA[X_VA, Z_VA, M_VA]
end

function Q_AE(θ, x1b, bh2o, x1air)
    x1 = x1b - x1air
    sx1 = sign(x1)

    coeff = 0.5rhoair * x1^2 * sx1
    R_AE = coeff * sbair(θ, bh2o) * cf0 * freair
    X_AE = -R_AE * cos(θ)
    Z_AE = R_AE * sin(θ)
    M_AE = -coeff * (szsbair(θ, bh2o) * cos(θ) - sxsbair(θ, bh2o) * sin(θ)) * cf0 * freair
    SA[X_AE, Z_AE, M_AE]
end

function Q_T(θ, x1b, x1va, γ_OA, γ′_OA, η)
    F_OAR = foa(γ_OA, γ′_OA, x1b, x1va, η)
    T_OAR = 2F_OAR * sin(γ_OA)
    X_T = T_OAR * cos(θ)
    Z_T = -T_OAR * sin(θ)
    SA[X_T, Z_T, 0]
end

function Q_ROAE(θ, x1b, x1air, θ_t, θ′_t)
    # x1w = 0
    # or 
    x1w = x′_w(θ_t, θ′_t)
    x1 = x1b - x1air + x1w * cos(θ)
    sx1 = sign(x1)

    coeff = 0.5rhoair * x1^2 * sx1
    R_ROAE = coeff * sro * cdro
    X_ROAE = -R_ROAE * cos(θ)
    Z_ROAE = R_ROAE * sin(θ)
    M_ROAE = -coeff * szsro * cdro
    SA[X_ROAE, Z_ROAE, M_ROAE]
end
