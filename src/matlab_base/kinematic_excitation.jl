t_periodic(t) = mod(t, T_t)

function η(t)
    # to - czas w danym okresie
    to = t_periodic(t)

    if to < T_in
        to / T_in
    elseif to < 0.5T_1 - T_out
        one(t)
    elseif to < 0.5T_1
        1 - (to - 0.5T_1 + T_out) / T_out
    else
        zero(t)
    end
end

function kpars(to)
    #KPARS Helper to get phase parameters.
    k1 = to <= 0.5T_1
    (k1, !k1) .* 1
end

function γ_OA(t)
    to = t_periodic(t)
    k1, k2 = kpars(to)
    0.5(γ_OA_max + γ_OA_min) -
    0.5(γ_OA_max - γ_OA_min) * (k1 * cospi(2to / T_1) - k2 * cospi(2(to - 0.5T_1) / T_2))
end

function γ′_OA(t)
    to = t_periodic(t)
    k1, k2 = kpars(to)
    -π *
    ((k2 * sinpi(2(T_1 / 2 - to) / T_2)) / T_2 + (k1 * sinpi(2to / T_1)) / T_1) *
    (γ_OA_min - γ_OA_max)
end

function γ′′_OA(t)
    to = t_periodic(t)
    k1, k2 = kpars(to)
    2π^2 *
    (k2 * cospi(2(T_1 / 2 - to) / T_2) / T_2^2 - k1 * cospi(2to / T_1) / T_1^2) *
    (γ_OA_min - γ_OA_max)
end

function θ_k(t)
    to = t_periodic(t)
    k1, k2 = kpars(to)

    0.5(θ_k_max + θ_k_min) +
    0.5(θ_k_max - θ_k_min) * (k1 * cospi(2to / T_1) - k2 * cospi(2(to - 0.5T_1) / T_2))
end

function θ′_k(t)
    to = t_periodic(t)
    k1, k2 = kpars(to)

    π *
    (k2 * sinpi(2(T_1 / 2 - to) / T_2) / T_2 + k1 * sinpi(2to / T_1) / T_1) *
    (θ_k_min - θ_k_max)
end

function θ′′_k(t)
    to = t_periodic(t)
    k1, k2 = kpars(to)

    -2 *
    pi^2 *
    (k2 * cospi(2(T_1 / 2 - to) / T_2) / T_2^2 - k1 * cospi(2to / T_1) / T_1^2) *
    (θ_k_min - θ_k_max)
end

function θ_t(t)
    to = t_periodic(t)
    k1, k2 = kpars(to)

    0.5(θ_t_max + θ_t_min) +
    0.5(θ_t_max - θ_t_min) * (k1 * cospi(2to / T_1) - k2 * cospi(2(to - 0.5T_1) / T_2))
end

function θ′_t(t)
    to = t_periodic(t)
    k1, k2 = kpars(to)

    π *
    (k2 * sinpi(2(T_1 / 2 - to) / T_2) / T_2 + k1 * sinpi(2to / T_1) / T_1) *
    (θ_t_min - θ_t_max)
end

function θ′′_t(t)
    to = t_periodic(t)
    k1, k2 = kpars(to)

    -2 *
    pi^2 *
    (k2 * cospi(2(T_1 / 2 - to) / T_2) / T_2^2 - k1 * cospi(2to / T_1) / T_1^2) *
    (θ_t_min - θ_t_max)
end