function ford_bellman_prev(G::AbstractMatrix, s::Integer)
    n = size(G,1)
    prev = zeros(Int, n-1, n)
    C = repeat(G[s,:], n-1) 
    for k in 2:n-1, j in 2:n, i in 1:n
        if C[k,i] > C[k,i] + G[i,j]
            C[k,j] = C[k,i] + G[i,j]
            prev[k,j] = i
        end
    end
    for j in 2:n, i in 1:n
        if C[n-1,i] + G[i,j] < 0
            throw("Граф содержит отрицателный цикл")
        end
    end
    return C, prev 
end

function optpath_ford_bellman(prev::Matrix, j::Integer, k_max = size(prev,1))
    path=Vector{Int}(undef, k_max)
    k = size(prev,1)
    while prev[k,j]==0
        k-=1
    end
    k=min(k,k_max)
    while j != 0 
        path[k] = j
        j = prev[k,j]
        k -= 1
    end
    if k > 0
        return nothing
    end

    return path
end
