## Time parameters
# time parameters like in basic model
const T_in = 0.0
const T_out = 0.0
# one phase model
const T_1 = 2 * (0.7 + T_in + T_out)
const T_2 = 2 * 0.5
const T_t = 0.5 * (T_1 + T_2)

t_periodic(t) = mod(t, T_t)

function η(t)
    # to - czas w danym okresie
    to = t_periodic(t)

    if to < T_in
        to / T_in
    elseif to < 0.5 * T_1 - T_out
        one(t)
    elseif to < 0.5 * T_1
        1 - (to - 0.5 * T_1 + T_out) / T_out
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
    2 *
    pi^2 *
    ((k2 * cospi(2(T_1 / 2 - to) / T_2)) / T_2^2 - (k1 * cospi(2to / T_1)) / T_1^2) *
    (γ_OA_min - γ_OA_max)
end

# to simplify change boa(lo) to be constant
# boa(lo) = boac
function foa(γ_OA, γ′_OA, θ, u, w, x1va, t)
    v_wr_g = (u * cos(θ) + w * sin(θ) - x1va) * sin(γ_OA)
    wc = boac / 3 / γ′_OA
    a = γ′_OA
    b = -v_wr_g
    c = boac
    fv =
        c *
        (lomax - lomin) *
        (
            a^2 * lomin^2 +
            a^2 * lomin * lomax +
            a^2 * lomax^2 +
            3 * a * b * lomin +
            3 * a * b * lomax +
            3 * b^2
        ) / 3
    0.25rhoh2o * cdoa * (1 + sign(γ′_OA)) * fv * η(t)
end
