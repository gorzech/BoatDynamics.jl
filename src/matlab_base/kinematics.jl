F_0(θ_t) = asin(l_t / l_s * sin(θ_t))
F_1(θ_t) = (l_t / l_s * cos(θ_t)) / (1 - (l_t / l_s * sin(θ_t))^2)^0.5

θ_s(θ_t) = F_0(θ_t)
θ′_s(θ_t, θ′_t) = θ′_t * F_1(θ_t)

x_w(θ_t) = l_t * cos(θ_t) + l_s * cos(θ_s(θ_t)) + x_SB

r_w(θ_t) = SA[x_w(θ_t), 0]

x′_w(θ_t, θ′_t) = -l_t * sin(θ_t) * θ′_t - l_s * sin(θ_s(θ_t)) * θ′_s(θ_t, θ′_t)

r′_w(θ_t, θ′_t) = SA[x′_w(θ_t, θ′_t), 0]

crossθ(θ, v) = SA[θ*v[2], -θ*v[1]]