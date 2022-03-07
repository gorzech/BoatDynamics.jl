function system_lhs(boat_angles::Boat_angles)
    inertia_lhs(SA[boat_angles.θ_t, boat_angles.θ_k, boat_angles.γ_OA])
end

function system_rhs(u, w, θ′, boat_angles::Boat_angles)
    inertia_rhs(
        SA[
            u,
            w,
            θ′,
            boat_angles.θ_t,
            boat_angles.θ′_t,
            boat_angles.θ′′_t,
            boat_angles.θ_k,
            boat_angles.θ′_k,
            boat_angles.θ′′_k,
            boat_angles.γ_OA,
            boat_angles.γ′_OA,
            boat_angles.γ′′_OA,
        ],
    )
end
