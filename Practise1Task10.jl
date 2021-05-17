function nummax(A)
    max=A[firstindex(A)]
    count = 1
    for i in firstindex(A)+1:lastindex(A)
        if max==A[i]
            count+=1
        end
        if A[i]>max
            max=A[i]
            count=1
        end
    end
    return count
end