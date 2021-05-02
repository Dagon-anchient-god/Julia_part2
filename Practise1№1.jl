function srez(A::Matrix,B,C)
    Z=Matrix{eltype(A)}(undef,length(B),length(C))
    for i in B
        for j in C
            Z[i,j] = A[B[i],C[j]]
        end
    end
    return Z
end