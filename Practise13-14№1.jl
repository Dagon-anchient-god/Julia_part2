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

struct RepPlacement{N,K} <: AbstractCombinObject
    value::Vector{Int}
    set::Vector
end

RepPlacement{K}(n::Integer) where K = RepPlacement{K}(ones(Int, K),collect(1:n))
RepPlacement{K}(set::Set) where K = RepPlacement{K}(ones(Int, K),collect(set))




Base.get(placement::RepPlacement) = placement.set(placement.value)

function next!(placement::RepPlacement)
    c = placement.value
    n = length(placement.set)
    i = findlast(item->item < n, c)
    if isnothing(i)
        return false
    end
    c[i] += 1
    c[i+1:end] .= 1
    return true
end


struct Replacement{N,K} <: AbstractCombinObject
    value::Vector{Int}
    count::Vector
end

Replacement{N,K}() where {N,K} = Replacement{N,K}(ones(Int, K),[0])

function next!(placement::Replacement{N,K}) where {N,K}
    c = get(placement)
    placement.count[1] += 1
    c[begin:end] = digits(placement.count[1],N,K)
    i = findlast(item->item < N, c)
    if isnothing(i)
        return false
    end
    return true
end

function digits(num,n,K)
    res = []
    for i in 1:K
        push!(res,num%n+1)
        num ÷= n
        for j in i:-1:2
            res[j],res[j-1]=res[j-1],res[j]
        end
    end
    return convert(Array{Int,1},res)
end
