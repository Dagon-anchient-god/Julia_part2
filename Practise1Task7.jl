function insertsort!(A)
    for i in 2:length(A)
        key = A[i]
        j = i - 1
        while j >= 1 && A[j] > key
            A[j + 1] = A[j]
            j -= 1
        end
        A[j + 1] = key
    end
    return A
end

function insertsort(A)
    insertsort!(deepcopy(A))
end

function insertsortperm!(A)
    numbers = collect(1:length(A))
    for i in 2:length(A)
        key = A[i]
        j = i - 1
        while j >= 1 && A[j] > key
            A[j + 1] = A[j]
            numbers[j + 1],numbers[j] =numbers[j],numbers[j + 1]
            j -= 1
        end
        A[j + 1] = key
        numbers[j + 1],numbers[i] = numbers[i],numbers[j + 1]
    end
    return numbers
end

function insertsortperm(A)
    insertsortperm!(deepcopy(A))
end