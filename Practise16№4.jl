function floyd(G::AbstractMatrix)
    n=size(A,1)
    C=Array{eltype(G),2}(undef,n,n) 
    C=G
    for k in 1:n, i in 1:n, j in 1:n
        C[i,j]=min(C[i,j], C[i,k]+C[k,k,j])
    end
    for j in 2:n, i in 1:n
        if C[n-1,i] + G[i,j] < 0
            throw("Граф содержит отрицателный цикл")
        end
    end
    return C
end
