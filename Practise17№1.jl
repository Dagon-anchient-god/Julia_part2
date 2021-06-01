function dfsearch(startver, graph)
    mark = zeros(Bool, length(graph))
    stack  = [startver] 
    mark[startver] = 1 
    while !isempty(stack)
        v = pop!(stack) 
        println(v)
        for u in graph[v] 
            if mark[u] == 0
                push!(stack,u) 
                mark[u] = 1 
            end
        end
    end
end