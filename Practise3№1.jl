function transposeM!(A)
    n,m = size(A)
    B=Matrix{eltype(A)}(undef,m,n)
    for j in 1:n
        for i in 1:m
            B[i,j] = A[j,i]
        end
    end
    A=B
    return A
end