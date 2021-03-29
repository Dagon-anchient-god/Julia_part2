function shaker!(A)
    a=firstindex(A)
    b=length(A)
    while (a<=b)
        for i in b:a+1
            if A[i-1]>A[i]
                A[i-1],A[i]=A[i],A[i-1]
            end
        end
        a=a+1
        for j in a:b+
            if A[j-1]>A[j]
                A[j-1],A[j]=A[j],A[j-1]
            end
        end
        b=b-1
    end
    return A
end