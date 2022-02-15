@testset "kinetic energy zero at zero velocity" begin
    T = @test_nowarn kinetic_energy(0.0, 0.0, 0.0)
    @test T == 0.0
end

@testset "kinetic energy non-negative on various inputs" begin
    @test kinetic_energy(-0.1, 0.0, 0.0) ≥ 0
    @test kinetic_energy(0.1, 0.0, 0.0) ≥ 0
    @test kinetic_energy(0.0, -0.2, 0.0) ≥ 0
    @test kinetic_energy(0.1, 0.12, 0.0) ≥ 0
    @test kinetic_energy(0.0, 0.0, -0.22) ≥ 0
    @test kinetic_energy(0.0, 0.4, 0.22) ≥ 0
    @test kinetic_energy(-1000.0, 100.4, 10.22) ≥ 0
    @test kinetic_energy(-1000.0, -100.4, -1000.22) ≥ 0
    x = randn(3, 12) * 1e3
    for p in eachcol(x)
        @test kinetic_energy(p...) ≥ 0
    end
end
