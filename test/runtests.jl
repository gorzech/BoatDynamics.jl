using StaticArrays
using HCubature
using ForwardDiff

using Revise
using BoatDynamics
import BoatDynamics: BoatDynamics as bd
using Test

@testset "BoatDynamics.jl" begin
    include("kinetic_energy_test.jl")
    include("approximate_inertia_test.jl")
end
