using StaticArrays
using HCubature
using ForwardDiff

using Revise
using BoatDynamics
import BoatDynamics: BoatDynamics as bd
using Test
include("boat_integrals_helper.jl")

@testset "BoatDynamics.jl" begin
    include("kinetic_energy_test.jl")
    include("inertia_approx_test.jl")
    include("water_volume_approx_test.jl")
end
