module TwoElementBooleanAlgebra
    """
        B

    Simplest non-trivial Boolean algebra, the two-element Boolean algebra.

    Subtypes `Integer`.

    Different from `Bool` in that `one(B) + one(B)` equals one instead of two.
    """
    struct B <: Integer
        b::Bool
        function B(b::Bool)
            new(b)
        end
    end
    function B(b::Int)
        B(Bool(b))
    end
    function Base.Bool(b::B)
        b.b
    end
    function Base.Int(b::B)
        Int(Bool(b))
    end
    function Base.:(+)(l::B, r::B)
        B(l.b | r.b)
    end
    function Base.:(*)(l::B, r::B)
        B(l.b & r.b)
    end
    function Base.:(<)(l::B, r::B)
        l.b < r.b
    end
    function Base.typemin(::Type{B})
        zero(B)
    end
    function Base.typemax(::Type{B})
        one(B)
    end
    function Base.:(!)(b::B)
        B(!(b.b))
    end
    function Base.show(io::IO, b::B)
        show(io, B)
        print(io, '(')
        show(io, Int(b))
        print(io, ')')
    end
end
