# BooleanSemiring

[![Build Status](https://github.com/nsajko/BooleanSemiring.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/nsajko/BooleanSemiring.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Package version](https://juliahub.com/docs/General/BooleanSemiring/stable/version.svg)](https://juliahub.com/ui/Packages/General/BooleanSemiring)
[![Package dependencies](https://juliahub.com/docs/General/BooleanSemiring/stable/deps.svg)](https://juliahub.com/ui/Packages/General/BooleanSemiring?t=2)
[![Coverage](https://codecov.io/gh/nsajko/BooleanSemiring.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/nsajko/BooleanSemiring.jl)
[![PkgEval](https://JuliaCI.github.io/NanosoldierReports/pkgeval_badges/B/BooleanSemiring.svg)](https://JuliaCI.github.io/NanosoldierReports/pkgeval_badges/B/BooleanSemiring.html)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

The Boolean semiring, also known as the two-element Boolean algebra.

The only public binding is the Boolean semiring type, `B`. It is different from `Bool` in that `one(B) + one(B)` equals one instead of two.

An application: representing a mathematical relation with a logical array. Specifically, an `X::AbstractMatrix{B}` represents a binary relation. Furthermore, then:

* matrix addition (`X + Y`) corresponds to relation union

* pointwise multiplication (`X .* Y`) of matrices corresponds to relation intersection

* matrix multiplication (`X * Y`) corresponds to relation composition

* matrix transpose (`transpose(X)`) or adjoint (`adjoint(X)` or `X'`) results in the converse relation

* pointwise negation (`(!).(X)`) results in the complementary relation

* pointwise partial order (`all(splat(≤), zip(X, Y))`) corresponds to the subset/inclusion predicate

## Usage example

```julia-repl
julia> using BooleanSemiring: B

julia> B(0)
B(0)

julia> B(0) + B(0)
B(0)

julia> B(0) + B(1)
B(1)

julia> B(1) + B(1)
B(1)

julia> B(0) * B(1)
B(0)

julia> !B(0)
B(1)
```
