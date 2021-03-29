function slice(A::Vector{T},p::Vector{Int}) ::Vector{T} where T
    srez = Vector{Int}(undef,size(p))
    for i in 1:size(p)
        srez[i]=A[i]
    end
    return srez
end

function slice(A::Vector{T},p::Vector{Int}) ::Vector{T} where T
    return A[p]
end
