F_0(θ_t) = asin(l_t / l_s * sin(θ_t))
F_1(θ_t) = (l_t / l_s * cos(θ_t)) / (1 - (l_t / l_s * sin(θ_t))^2)^0.5

θ_s(θ_t) = F_0(θ_t)
θ′_s(θ_t, θ′_t) = θ′_t * F_1(θ_t)

x_w(θ_t) = l_t * cos(θ_t) + l_s * cos(θ_s(θ_t)) + x_SB

r_w(θ_t) = SA[x_w(θ_t), 0]

x′_w(θ_t, θ′_t) = -l_t * sin(θ_t) * θ′_t - l_s * sin(θ_s(θ_t)) * θ′_s(θ_t, θ′_t)

r′_w(θ_t, θ′_t) = SA[x′_w(θ_t, θ′_t), 0]

const r_SB = SA[x_SB, 0]

crossθ(θ, v) = SA[θ*v[2], -θ*v[1]]

r_s_∂l_s(θ_t) = SA[cos(θ_s(θ_t)), sin(θ_s(θ_t))]
const r_s_const = r_SB

r_t_∂l_t(θ_t) = SA[-cos(θ_t), sin(θ_t)]
r_t_const(θ_t) = r_w(θ_t)

r_k_∂l_k(θ_k) = SA[-cos(θ_k), sin(θ_k)]
r_k_const(θ_t) = r_w(θ_t)