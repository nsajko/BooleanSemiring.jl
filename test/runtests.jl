using BooleanSemiring
using Test
using Aqua

@testset "BooleanSemiring.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(BooleanSemiring)
    end
    # Write your tests here.
end
