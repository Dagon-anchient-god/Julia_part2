function attempt_devide!(start_ver, graph, mark)   
    queue = [startver] 
    mark[startver] = 1 
    while !isempty(queue)
        v = popfirst!(queue)
        for u in graph[v]
            next_num = (mark[v] % 2) + 1
            if mark[u] == 0    
                push!(queue, u)
                mark[u] = next_num
            elseif mark[u] == next_num
                return false
            end
        end
    end
    return true
end