module TwoElementBooleanAlgebra
    export Boole
    """
        Boole

    Simplest non-trivial Boolean algebra, the two-element Boolean algebra.

    Subtypes `Integer`.

    Different from `Bool` in that `one(Boole) + one(Boole)` equals one instead of two.
    """
    struct Boole <: Integer
        b::Bool
        function Boole(b::Bool)
            new(b)
        end
    end
    function Boole(b::Int)
        Boole(Bool(b))
    end
    function Base.Bool(b::Boole)
        b.b
    end
    function Base.Int(b::Boole)
        Int(Bool(b))
    end
    function Base.:(+)(l::Boole, r::Boole)
        Boole(l.b | r.b)
    end
    function Base.:(*)(l::Boole, r::Boole)
        Boole(l.b & r.b)
    end
    function Base.:(<)(l::Boole, r::Boole)
        l.b < r.b
    end
    function Base.typemin(::Type{Boole})
        zero(Boole)
    end
    function Base.typemax(::Type{Boole})
        one(Boole)
    end
    function Base.:(!)(b::Boole)
        Boole(!(b.b))
    end
    function Base.show(io::IO, b::Boole)
        show(io, Boole)
        print(io, '(')
        show(io, Int(b))
        print(io, ')')
    end
    function Base.promote_rule(::Type{Boole}, ::Type{Int})
        Int
    end
    function Base.promote_rule(::Type{Int}, ::Type{Boole})
        Int
    end
end
