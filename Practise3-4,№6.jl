function permute_!(A,perm)
    for _ in 1:length(A)
        for i in 1:length(A)
            A[i],A[perm[i]]=A[perm[i]],A[i]
            perm[perm[i]],perm[i]=perm[i],perm[perm[i]]
        end
    end
    return A
end

