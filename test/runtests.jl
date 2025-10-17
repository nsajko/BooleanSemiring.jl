using TwoElementBooleanAlgebra
using Test

@testset "TwoElementBooleanAlgebra.jl" begin
    @testset "construction" begin
        @test Boole(0) === Boole(false)
        @test Boole(1) === Boole(true)
    end
    @testset "conversion to `Base` types" begin
        for x ∈ 0:1
            for typ ∈ (Bool, Int)
                @test typ(x)::typ === typ(Boole(typ(x)::typ)::Boole)
                @test typ(x)::typ === convert(typ, Boole(typ(x)::typ)::Boole)
            end
        end
    end
    @testset "`zero`, `one`" begin
        @test zero(Boole) === Boole(0)
        @test one(Boole) === Boole(1)
        @test zero(Boole(1)) === Boole(0)
        @test one(Boole(1)) === Boole(1)
    end
    @testset "`iszero``, `isone`" begin
        @test iszero(Boole(0))
        @test isone(Boole(1))
    end
    @testset "matrix multiplication" begin
        @testset "2x2" begin
            mat_one = [Boole(1) Boole(0); Boole(0) Boole(1)]
            mat_zero = [Boole(0) Boole(0); Boole(0) Boole(0)]
            enumer = (Boole(0), Boole(1))
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
                @test (l < r) === (Boole(l) < Boole(r))
                @test (l ≤ r) === (Boole(l) ≤ Boole(r))
            end
        end
    end
    @testset "`typemin`, `typemax`" begin
        @test typemin(Boole) === zero(Boole)
        @test typemin(Boole(1)) === zero(Boole)
        @test typemax(Boole) === one(Boole)
        @test typemax(Boole(1)) === one(Boole)
    end
    @testset "negate" begin
        @test Boole(0) === !Boole(1)
        @test Boole(1) === !Boole(0)
    end
    @testset "`show`" begin
        @test "Boole(0)" == repr(Boole(0))
        @test "Boole(1)" == repr(Boole(1))
    end
    @testset "promotion" begin
        @test (1, 1) === promote(Boole(1), 1)
    end
end

using Aqua: Aqua

@testset "Code quality (Aqua.jl)" begin
    Aqua.test_all(TwoElementBooleanAlgebra)
end
