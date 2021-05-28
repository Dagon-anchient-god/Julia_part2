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

struct SetIndicator{N} <: AbstractCombinObject
    value::Vector{Bool}
end

SetIndicator{N}() where N = SetIndicator{N}(zeros(Bool, N))

function next!(indicator::SetIndicator)
    i = findlast(item->item==0, indicator.value)
    if isnothing(i)
        return false
    end
    indicator.value[i] = 1
    indicator.value[i+1:end] .= 0
    return true 
end