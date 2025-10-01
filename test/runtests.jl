using BooleanSemiring
using BooleanSemiring: B
using Test

@testset "BooleanSemiring.jl" begin
    @testset "construction" begin
        @test B(0) === B(false)
        @test B(1) === B(true)
    end
    @testset "`zero`, `one`" begin
        @test zero(B) === B(0)
        @test one(B) === B(1)
        @test zero(B(1)) === B(0)
        @test one(B(1)) === B(1)
    end
    @testset "`iszero``, `isone`" begin
        @test iszero(B(0))
        @test isone(B(1))
    end
    @testset "matrix multiplication" begin
        @testset "2x2" begin
            mat_one = [B(1) B(0); B(0) B(1)]
            mat_zero = [B(0) B(0); B(0) B(0)]
            enumer = (B(0), B(1))
            for (b11, b12, b21, b22) ∈ Iterators.product(enumer, enumer, enumer, enumer)
                mat = [b11 b12; b21 b22]
                @test mat_zero == mat * mat_zero
                @test mat_zero == mat_zero * mat
                @test mat_zero == mat .* mat_zero
                @test mat_zero == mat_zero .* mat
                @test mat == mat * mat_one
                @test mat == mat_one * mat
                @test mat_one == mat_one + mat_one
                @test mat_one == mat_one .+ mat_one
            end
        end
    end
end

using Aqua: Aqua

@testset "Code quality (Aqua.jl)" begin
    Aqua.test_all(BooleanSemiring)
end
