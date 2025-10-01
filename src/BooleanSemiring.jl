module BooleanSemiring
    """
        B

    The two-element Boolean algebra.
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
end
