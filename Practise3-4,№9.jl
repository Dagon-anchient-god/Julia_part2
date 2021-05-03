function reverse_user!(A)
    for i in firstindex(A):lastindex(A)÷2
        A[i],A[lastindex(A)-i+1]=A[lastindex(A)-i+1],A[i]
    end
    return A
end


