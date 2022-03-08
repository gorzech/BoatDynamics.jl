@testset "kinetic energy zero at zero velocity" begin
    θ_t = deg2rad(30.0)
    θ′_t = 0.0
    θ_k = deg2rad(22.0)
    θ′_k = 0.0
    γ_OA = deg2rad(60.0)
    γ′_OA = 0.0
    T = @test_nowarn kinetic_energy(0.0, 0.0, 0.0, θ_t, θ′_t, θ_k, θ′_k, γ_OA, γ′_OA)
    @test T == 0.0
end

@testset "kinetic energy non-negative on various inputs" begin
    θ_t = deg2rad(30.0)
    θ′_t = 0.0
    θ_k = deg2rad(22.0)
    θ′_k = 0.1
    γ_OA = deg2rad(60.0)
    γ′_OA = -0.2
    @test kinetic_energy(-0.1, 0.0, 0.0, θ_t, θ′_t, θ_k, θ′_k, γ_OA, γ′_OA) ≥ 0
    @test kinetic_energy(0.1, 0.0, 0.0, θ_t, θ′_t, θ_k, θ′_k, γ_OA, γ′_OA) ≥ 0
    @test kinetic_energy(0.0, -0.2, 0.0, θ_t, θ′_t, θ_k, θ′_k, γ_OA, γ′_OA) ≥ 0
    @test kinetic_energy(0.1, 0.12, 0.0, θ_t, θ′_t, θ_k, θ′_k, γ_OA, γ′_OA) ≥ 0
    @test kinetic_energy(0.0, 0.0, -0.22, θ_t, θ′_t, θ_k, θ′_k, γ_OA, γ′_OA) ≥ 0
    @test kinetic_energy(0.0, 0.4, 0.22, θ_t, θ′_t, θ_k, θ′_k, γ_OA, γ′_OA) ≥ 0
    @test kinetic_energy(-1000.0, 100.4, 10.22, θ_t, θ′_t, θ_k, θ′_k, γ_OA, γ′_OA) ≥ 0
    @test kinetic_energy(-1000.0, -100.4, -1000.22, θ_t, θ′_t, θ_k, θ′_k, γ_OA, γ′_OA) ≥ 0
    x = randn(9, 12) .* [ones(3) .* 1e3; ones(6) .* 0.1]
    for p in eachcol(x)
        @test kinetic_energy(p...) ≥ 0
    end
end
