module BoatDynamics
using LinearAlgebra
using DifferentialEquations
using StaticArrays

# Write your package code here.
include("matlab_base/model_constants.jl")
include("matlab_base/funshapeex.jl")
include("matlab_base/kinematics.jl")
include("matlab_base/kinematic_excitation.jl")
export Boat_timing

include("kinetic_energy.jl")
export kinetic_energy

include("helper.jl")

include("matlab_base/oar_force.jl")
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
export solve_boat, Boat_settings, Boat_timing, find_the0

end
