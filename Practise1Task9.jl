function quicsearch(A,b)
    first = firstindex(A)
    last = lastindex(A)
    index = -1
    bool= false
    while (first+1 < last) &&(index == -1)
        mid = (first+last)÷2
        if A[mid] == b
            index = mid
            bool=true
        else
            if b<A[mid]
                last = mid -1
            else
                first = mid +1
            end
        end
    end
    if A[first]>b
        index=first
        bool=false
    elseif A[last]>b
        index=last
        bool=false
    elseif A[last]<b
        index=last+1
        bool=false
    end
    return bool,index
end

function insertsort!(A)
    for i in 2:length(A)
        key = A[i]
        j = i
        c,d=quicsearch(A[1:i-1],key)
        while d!=j 
            A[j],A[j-1]=A[j-1],A[j]
            j=j-1
        end
    end
    return A
end
