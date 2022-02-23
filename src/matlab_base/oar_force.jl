# to simplify change boa(lo) to be constant
# boa(lo) = boac
function foa(γ_OA, γ′_OA, x1b, x1va, η)
    v_wr_g = (x1b - x1va) * sin(γ_OA)
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
    0.25rhoh2o * cdoa * (1 + sign(γ′_OA)) * fv * η
end
