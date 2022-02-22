function equations_to_matrix_form(eqs, vars)
    expand_eqs = expand_derivatives.(eqs)
    A = Symbolics.jacobian(expand_eqs, vars; simplify = true)
    # # Ensure none of x is in A
    # vars_A = Symbolics.get_variables(A)
    # if !isempty(vars_A)
    #     for v in vars
    #         @assert all(vars_A .!= v)
    #     end
    # end
    
    b = simplify.(-substitute(expand_eqs, Dict(v => 0 for v in vars)))
    A, b
end

function generate_equations_of_motion()
    @variables t
    @variables u(t) w(t) θ′(t)

    @variables θ_t(t) θ_k(t) γ_OA(t)

    LT = symbolic_kinetic_energy(u, w, θ′, t, θ_t = θ_t, θ_k = θ_k, γ_OA = γ_OA)

    D = Differential(t)
    # Need to generate A and b for Ax = b where x is D(u), D(w), D(θ′)

    # To me A = jacobian of LT w.r.t x assuming LT is linear in x
    x = [D(u), D(w), D(θ′)]
    A, b = equations_to_matrix_form(LT, x)
    println("Variables in A and b after equations_to_matrix_form")
    println(Symbolics.get_variables.(A))
    println(Symbolics.get_variables.(b))

    generated_dir = joinpath(@__DIR__, "..", "generated")
    funA, _ = build_function(A, (θ_t, θ_k, γ_OA))
    write(joinpath(generated_dir, "inertia_lhs.jl"), string(funA))

    funb, _ = build_function(b, (u, w, θ′, #=t,=# θ_t, D(θ_t), D(D(θ_t)), θ_k, D(θ_k), D(D(θ_k)), γ_OA, D(γ_OA), D(D(γ_OA))))
    write(joinpath(generated_dir, "inertia_rhs.jl"), string(funb))
    (funA, funb)
end