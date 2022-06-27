# θ_t - kąt pomiędzy udem a osią x 0-45
# θ_k kąty pomiędzy tułowiem a osią x # 120 to 60
# kąty obrotu wiosla 30-120
# User interface
struct Boat_settings
    angle_ranges::Boat_angle_ranges
    timing::Boat_timing
    x1va::Float64
    x1air::Float64
    active_equations::Vector{Int}
end


Boat_settings(γ_minmax, θ_t_minmax, θ_k_minmax, timing, x1va, x1air, active_equations) =
    Boat_settings(Boat_angle_ranges(γ_minmax, θ_t_minmax, θ_k_minmax), timing, x1va, x1air, active_equations)

Boat_settings(γ_minmax, θ_t_minmax, θ_k_minmax, timing, x1va, x1air) =
    Boat_settings(γ_minmax, θ_t_minmax, θ_k_minmax, timing, x1va, x1air, [1, 2, 3])

Boat_settings() = Boat_settings(Boat_angle_ranges(), Boat_timing(), 0.0, 0.0)