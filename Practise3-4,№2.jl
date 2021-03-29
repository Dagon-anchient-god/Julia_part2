function betterbubblesort!(A)
    n = length(A)
    v=0
    j=1
    for i in 1:n-1
        for j in 1:n-i
            if A[j]>A[j+1]
                A[j], A[j+1] = A[j+1], A[j]
                v=j+1
            end
        end
        j=v
    end
    return A
end