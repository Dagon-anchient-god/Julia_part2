function bfsearch(startver, graph) 
    mark = zeros(Bool, length(graph))
    queue  = [startver] 
    mark[startver] = 1
    while !isempty(queue)
        v = popfirst!(queue) 
        println(v)
        for u in graph[v] 
            if mark[u] == 0
                push!(queue, u)
                mark[u] = 1 
            end
        end
    end
end