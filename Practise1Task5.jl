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

function sortkey!(A, key_values)
    num = bubblesortperm!(key_values)
    return @view A[num]
end

function sortkey!(A, F::Function)
    num = bubblesortperm!(F(A))
    return A[num]
end

for i in 1:size(A,2)
    B=vcat(sortkey!([@viev A[:,i]] , sum( A, dims=2)))
end 

for i in 1:size(A,2)
    a = @viev A[:,i]
    key_values = length(findall(a .== 0))
    B=vcat(sortkey!(a,key_values))
end