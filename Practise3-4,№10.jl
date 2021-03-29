function nextindex(k,m,A)
    return (k+m)%length(A)
end

function sdvig(A,m)
    for i in 1:length(A)
        A[i],A[nextindex(i,m,A)]=A[nextindex(i,m,A)],A[i]
    end
    return A
end
