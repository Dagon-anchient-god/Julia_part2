function myunique!(A)
    sort!(A)
end

function myunique(A)
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