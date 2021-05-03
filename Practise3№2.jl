function indprem!(A,B)
    for _ in 1:length(A)
        for i in 1:length(A)
            A[i],A[B[i]]=A[B[i]],A[i]
            B[B[i]],B[i]=B[i],B[B[i]]
        end
    end
    return A
end

A=[5,2,7,1,3,6,4]
B=[5,2,7,1,3,6,4]