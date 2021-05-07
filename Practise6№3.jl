function sortb(A,b)
    i=1
    j=1
    l=lastindex(A)
    while j<l
        while A[i]>b && j<l
            if A[i]>b 
                A[l],A[i]=A[i],A[l]
                l=l-1
            end  
        end
        j=j+1
        i=i+1 
    end
    return A
end
