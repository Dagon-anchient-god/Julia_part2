function calcsort!(A,values::UnitRange{Int})
    store = zeros(Int, size(values))
    for i in 1:length(A)
        for j in 1:length(values)
            if A[i]==values[j]
                store[j]+=1
            end
        end
    end
    k=1
    for i in 1:length(values)
        while store[i]>0
            A[k]=values[i]
            k+=1
            store[i]-=1
        end
    end
    return A
end

function calcsort!(A,values::Vector{Int})
    store = zeros(Int, size(values))
    for i in 1:length(A)
        for j in 1:length(values)
            if A[i]==values[j]
                store[j]+=1
            end
        end
    end
    k=1
    for i in 1:length(values)
        while store[i]>0
            A[k]=values[i]
            k+=1
            store[i]-=1
        end
    end
    return A
end

