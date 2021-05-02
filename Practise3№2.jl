function transposeVM!(A)
    n,m = size(A)
    for j in 1:n
        for i in j:m
            temp = A[i,j]
            A[i,j] = A[j,i]
            A[j,i] = temp
        end
    end
    return A
end