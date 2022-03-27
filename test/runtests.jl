using StaticArrays
using HCubature
using ForwardDiff

using Revise
using BoatDynamics
import BoatDynamics: BoatDynamics as bd
using Test
include("boat_integrals_helper.jl")

function water_line_z(x, bh2o, the)
    # x_W = bd.xo - bh2o / tt # x coordinate for water level in boat coordinate system
    # (x - x_W) * tt # z coordinate of water level in boat coord system for given x
    # combined
    (x - bd.xo) * tan(-the) + bh2o
end

@testset "BoatDynamics.jl" begin
    include("kinetic_energy_test.jl")
    include("inertia_approx_test.jl")
    include("water_volume_approx_test.jl")
    include("water_area_approx_test.jl")
end
