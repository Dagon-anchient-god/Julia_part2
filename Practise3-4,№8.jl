function myunique(A)
    sort!(A)
    unigue= [A[firstindex(A)]]
    for i in firstindex(A)+1:lastindex(A)
        if A[i]!=unigue[lastindex(unigue)]
            push!(unigue,A[i])
        end
    end
    return unigue
end

function myunique!(A)
    sort!(A)
    k=1
    for i in firstindex(A):(lastindex(A)-1-k)
        while A[i]==A[i+1]
            deleteat!(A,i+1)
            k=k+1
        end
    end
    return A
end

function allunique(A)
    for i in 1:length(A)
        for j in i+1:length(A)
            if A[i]==A[j]
                return false
            end
        end
    end
    return true
end

A=[10, 12 ,30, 40 ,13 ,60, 70, 14, 15, 16, 100, 110]