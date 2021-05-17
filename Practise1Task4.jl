function bubblesort(A::Matrix)
    for i in 1:size(A,2)
        bubblesort(@view A[:,i])
    end
end

function bubblesort!(A::Matrix)
    C = deepcopy(A)
    bubblesort(C)
    return C
end

function bubblesortperm!(A::Matrix)
    numbers = Matrix{eltype(A)}(undef,size(A)) 
    for i in 1:size(A,2)
        numbers[:,i] = bubblesortperm!(@view A[:,i])
    end
    return numbers
end

function bubblesortperm(A::Matrix)
    bubblesortperm!(deepcopy(A))
end



function bubblesort(A)
    for i in 1:length(A)-1
        for j in 1:length(A)-i
            if A[j] > A[j+1]
                A[j], A[j+1] = A[j+1], A[j]
            end
        end
    end
end

function bubblesortperm!(A)
    numbers = collect(1:length(A))
    for i in 1:length(A)-1
        for j in 1:length(A)-i
            if A[j] > A[j+1]
                A[j], A[j+1] = A[j+1], A[j]
                numbers[j],numbers[j+1] = numbers[j+1],numbers[j]
            end
        end
    end
    return numbers
end