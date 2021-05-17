function findallmax(A)
    max=A[firstindex(A)]
    count =Vector{Int}(undef,size(A))
    count =[firstindex(A)]
    for i in firstindex(A)+1:lastindex(A)
        if A[i]>max
            max=A[i]
            count =Vector{Int}(undef,size(A))
            count =[i]
        elseif A[i]==max   
            push!(count, i)
        end
    end
    return count
end
