using BooleanSemiring
using BooleanSemiring: B
using Test

@testset "BooleanSemiring.jl" begin
    @testset "construction" begin
        @test B(0) === B(false)
        @test B(1) === B(true)
    end
    @testset "conversion to `Base` types" begin
        for x ∈ 0:1
            for typ ∈ (Bool, Int)
                @test typ(x)::typ === typ(B(typ(x)::typ)::B)
                @test typ(x)::typ === convert(typ, B(typ(x)::typ)::B)
            end
        end
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
    @testset "order" begin
        for l ∈ 0:1
            for r ∈ 0:1
                @test (l < r) === (B(l) < B(r))
                @test (l ≤ r) === (B(l) ≤ B(r))
            end
        end
    end
    @testset "`typemin`, `typemax`" begin
        @test typemin(B) === zero(B)
        @test typemin(B(1)) === zero(B)
        @test typemax(B) === one(B)
        @test typemax(B(1)) === one(B)
    end
    @testset "negate" begin
        @test B(0) === !B(1)
        @test B(1) === !B(0)
    end
    @testset "`show`" begin
        @test "B(0)" == repr(B(0))
        @test "B(1)" == repr(B(1))
    end
end

using Aqua: Aqua

@testset "Code quality (Aqua.jl)" begin
    Aqua.test_all(BooleanSemiring)
end
