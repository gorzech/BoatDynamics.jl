#differential equation 1
function Q(θ, bh2o)
    Q_g(θ) #+ Q_BUOY(θ, bh2o) #+ Q_VA(θ, u, w, bh2o, x1va) + Q_AE(θ, u, w, bh2o, x1air) + Q_T() + Q_ROAE(θ, u, w, x1air)
end

# xoab = xoabme - xo

function Q_g(θ)
    sθ, cθ = sincos(θ)
    Xg = -m * g * sθ
    Zg = m * g * cθ
    Mg_RG = -m_RG * g * r_RG[1] * cθ
    Mg_w = -m_w * g * x_w(θ_t) * cθ
    Mg_fs = -m_fs * g * x_SB * cθ
    Mg_f = -m_f * g * x_SB * cθ
    Mg_k = -m_k * g * dot(r_w(θ_t) + r_k_const(θ_t) + 0.5l_k * r_k_∂l_k(θ_k), SA[cθ, sθ])
    Mg_t =
        -m_t * g * ((-0.5l_t * cos(θ_t) + 2x_w(θ_t)) * cos(θ) + 0.5l_t * sin(θ_t) * sin(θ))
    Mg_s =
        -m_s * g * ((0.5l_s * cos(F_0(θ_t)) + 2x_SB) * cos(θ) + 0.5l_t * sin(θ_t) * sin(θ))
    # Here is also a difference
    Mg_OA = -m_OA * g * 0.5(l_OAMX + l_OAMN) * x_OA_∂l_OA(γ_OA) * cθ
    # moa * g * (loamx + loamn) * cos(gamoa) * (cos(θ) + sin(θ))
    @debug "Mg parts are as follows: " Mg_RG Mg_w Mg_fs Mg_f Mg_k Mg_t Mg_s Mg_OA
    Mg = Mg_RG + Mg_w + Mg_fs + 2Mg_f + Mg_k + 2Mg_t + 2Mg_s + 2Mg_OA
    SA[Xg, Zg, Mg]
end

function Q_BUOY(θ, bh2o)
    F_BUOY = -rhoh2o * g * vh2o(θ, bh2o)
    X = -F_BUOY * sin(θ)
    Z = F_BUOY * cos(θ)
    M_BUOY = -rhoh2o * g * (szvh2o(θ, bh2o) * sin(θ) + sxvh2o(θ, bh2o) * cos(θ))
    SA[X, Z, M_BUOY]
end

function Q_VA(θ, u, w, bh2o, x1va)
    x1 = u * cos(θ) + w * sin(θ) - x1va
    sx1 = sign(x1)

    coeff = 0.5rhoh2o * x1^2 * sx1

    R_SHAPE = coeff * cdx * tvmh2o(θ) / cos(θ)
    R_VIS = coeff * cf0 * svbh2o(θ, bh2o) * freh2o
    R_VAVE = coeff * cdw * yth2ov(θ, bh2o)
    R_VA = R_SHAPE + R_VIS + R_VAVE
    X_VA = -R_VA * cos(θ)
    Z_VA = R_VA * sin(θ)
    M_SHAPE = -coeff * cdx * sztvmh2o(θ, bh2o) ./ cos(θ)
    M_VIS =
        -coeff * cf0 * (szsvbh2o(θ, bh2o) * cos(θ) + sxsvbh2o(θ, bh2o) * sin(θ)) * freh2o
    M_VAVE = -coeff * cdw * (z1yth2ov(θ, bh2o) * cos(θ) + x1yth2ov(θ, bh2o) * sin(θ))
    M_VA = M_SHAPE + M_VIS + M_VAVE
    SA[X_VA, Z_VA, M_VA]
end

function Q_AE(θ, u, w, bh2o, x1air)
    x1 = u * cos(θ) + w * sin(θ) - x1air
    sx1 = sign(x1)

    coeff = 0.5rhoair * x1^2 * sx1
    R_AE = coeff * sbair(θ, bh2o) * cf0 * freair
    X_AE = -R_AE * cos(θ)
    Z_AE = R_AE * sin(θ)
    M_AE = -coeff * (szsbair(θ, bh2o) * cos(θ) + sxsbair(θ, bh2o) * sin(θ)) * cf0 * freair
    SA[X_AE, Z_AE, M_AE]
end

function Q_T()
    F_OAR = foa(γ_OA, γ′_OA, θ, u, w, x1va, eta)
    T_OAR = 2F_OAR * sin(γ_OA)
    X_T = T_OAR * cos(θ)
    Z_T = -T_OAR * sin(θ)
    SA[X_T, Z_T, 0]
end

function Q_ROAE(θ, u, w, x1air)
    # x1w = 0
    # or 
    x1w = -θ′_t * (l_s * F_1(θ_t) + l_t) * sin(θ_t)
    x1 = u * cos(θ) + w * sin(θ) - x1air + x1w * cos(θ)
    sx1 = sign(x1)

    coeff = 0.5rhoair * x1^2 * sx1
    R_ROAE = coeff * sro * cdro
    X_ROAE = -R_ROAE * cos(θ)
    Z_ROAE = R_ROAE * sin(θ)
    M_ROAE = -coeff * szsro * cdro
    SA[X_ROAE, Z_ROAE, M_ROAE]
end
