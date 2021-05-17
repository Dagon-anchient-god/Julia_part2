function user_copy(A)
    B = Array{eltype(A)}(undef,length(A))
    for i in 1:length(A)
        B[i]=A[i]
    end
    return B
end

function user_copy(A::Matrix)
    B = Matrix{eltype(A)}(undef,size(A))
    for i in 1:size(A,2)
        B[:,i]=@view A[:,i]
    end
    return B
end