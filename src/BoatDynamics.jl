module BoatDynamics
using DifferentialEquations

# Write your package code here.
include("matlab_base/model_constants.jl")
include("matlab_base/funshapeex.jl")

include("kinetic_energy.jl")
export kinetic_energy

include("matlab_base/forces.jl")

include("symbolic/sym_kinetic_energy.jl")
include("symbolic/sym_generate_equations.jl")
export generate_equations_of_motion # For tests under development

if !isfile(joinpath(@__DIR__, "generated", "inertia_lhs.jl"))
    generate_equations_of_motion()
end
system_lhs = include("generated/inertia_lhs.jl")
system_rhs = include("generated/inertia_rhs.jl")
export system_lhs, system_rhs

include("solver/boat_odefun.jl")
export solve_boat

end
