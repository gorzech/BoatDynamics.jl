using Symbolics

function symbolic_kinetic_energy(u, w, θ′, t)
    T = kinetic_energy(u, w, θ′) 

    Du = Differential(u)
    Dw = Differential(w)
    Dθ′ = Differential(θ′)
    D = Differential(t)

    dT_du = Du(T)
    dT_dw = Dw(T)
    dT_dθ′ = Dθ′(T)

    # LHS of the equations
    L1 = D(dT_du) + dT_dw * θ′
    L2 = D(dT_dw) - dT_du * θ′
    L3 = D(dT_dθ′) + dT_du * w - dT_dw * u

    [L1, L2, L3]
end
