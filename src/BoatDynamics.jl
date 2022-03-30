module BoatDynamics
using LinearAlgebra
using DifferentialEquations
using SimpleDiffEq
using StaticArrays
using Plots

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
inertia_lhs = include("generated/inertia_lhs.jl")
inertia_rhs = include("generated/inertia_rhs.jl")

include("solver/system_eqs.jl")
export system_lhs, system_rhs

include("solver/boat_settings.jl")
export Boat_settings
include("solver/boat_odefun.jl")
include("solver/solve_boat.jl")
export solve_boat, find_the0

include("postprocess/animate.jl")
export animate_boat

end
