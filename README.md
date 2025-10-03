# TwoElementBooleanAlgebra

[![Build Status](https://github.com/nsajko/TwoElementBooleanAlgebra.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/nsajko/TwoElementBooleanAlgebra.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Package version](https://juliahub.com/docs/General/TwoElementBooleanAlgebra/stable/version.svg)](https://juliahub.com/ui/Packages/General/TwoElementBooleanAlgebra)
[![Package dependencies](https://juliahub.com/docs/General/TwoElementBooleanAlgebra/stable/deps.svg)](https://juliahub.com/ui/Packages/General/TwoElementBooleanAlgebra?t=2)
[![Coverage](https://codecov.io/gh/nsajko/TwoElementBooleanAlgebra.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/nsajko/TwoElementBooleanAlgebra.jl)
[![PkgEval](https://JuliaCI.github.io/NanosoldierReports/pkgeval_badges/B/TwoElementBooleanAlgebra.svg)](https://JuliaCI.github.io/NanosoldierReports/pkgeval_badges/B/TwoElementBooleanAlgebra.html)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

A software package for the Julia programming language implementing the simplest non-trivial Boolean algebra, the two-element Boolean algebra.

The only public binding is the type, `B`. It is different from `Bool` in that `one(B) + one(B)` equals one instead of two.

## Usage example

```julia-repl
julia> using TwoElementBooleanAlgebra: B

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

## An application: represent a relation with a logical array

A logical array represents a mathematical relation. Specifically, an `X::AbstractMatrix{B}` represents a binary relation. Then:

* matrix addition (`X + Y`) corresponds to relation union

* pointwise multiplication (`X .* Y`) of matrices corresponds to relation intersection

* matrix multiplication (`X * Y`) corresponds to relation composition

* matrix transpose (`transpose(X)`) or adjoint (`adjoint(X)` or `X'`) results in the converse relation

* pointwise negation (`(!).(X)`) results in the complementary relation

* pointwise partial order (`all(splat(≤), zip(X, Y))`) corresponds to the subset/inclusion predicate
