abstract type AbstractCombinObject

end

Base.iterate(obj::AbstractCombinObject) = (get(obj), nothing)
Base.iterate(obj::AbstractCombinObject, state) = 
    if next!(obj) == false
        nothing
    else
        (get(obj), nothing)
    end

Base.get(obj::AbstractCombinObject) = obj.value

struct Permute{N} <: AbstractCombinObject
    value::Vector{Int}
end

Permute{N}() where N = Permute{N}(collect(1:N))

function next!(w::Permute{N}) where N
    p=get(w)
    k=0
    for i in N-1:-1:1
        if p[i] < p[i+1]
            k=i
            break
        end
    end
    if k==0
        return false
    end
    i=k+1
    while i < N && p[i+1] > p[k]
        i+=1
    end
    p[k], p[i] = p[i], p[k]
    reverse!(@view p[k+1:end])
    return true
end