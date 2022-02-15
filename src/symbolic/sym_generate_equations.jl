function equations_to_matrix_form(eqs, vars)
    expand_eqs = expand_derivatives.(eqs)
    A = Symbolics.jacobian(expand_eqs, vars; simplify=true)
    # Ensure none of x is in A
    vars_A = Symbolics.get_variables(A)
    if !isempty(vars_A)
        for v in vars
            @assert all(vars_A .!= v)
        end
    end

    b = simplify.(-substitute(expand_eqs, Dict(v => 0 for v in vars)))
    A, b
end

function generate_equations_of_motion()
    @variables t
    @variables u(t) w(t) θ′(t)

    LT = symbolic_kinetic_energy(u, w, θ′, t)
    
    D = Differential(t)
    # Need to generate A and b for Ax = b where x is D(u), D(w), D(θ′)

    # To me A = jacobian of LT w.r.t x assuming LT is linear in x
    x = [D(u), D(w), D(θ′)]

    A, b = equations_to_matrix_form(LT, x)

    generated_dir = joinpath(@__DIR__, "..", "generated")
    funA, _ = build_function(A, (u, w, θ′))
    write(joinpath(generated_dir, "inertia_lhs.jl"), string(funA))

    funb, _ = build_function(b, (u, w, θ′, t))
    write(joinpath(generated_dir, "inertia_rhs.jl"), string(funb))
    (funA, funb)
end