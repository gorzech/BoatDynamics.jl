module BoatDynamics

# Write your package code here.
include("kinetic_energy.jl")
export kinetic_energy

include("symbolic/sym_kinetic_energy.jl")
export generate_equations_of_motion

end
