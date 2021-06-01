function val(graph)
    mark = zeros(Int, length(graph))
    stack  = [firstindex(graph)] 
    mark[firstindex(graph)] = 1 
    while !isempty(stack)
        v = pop!(stack) 
        for u in graph[v] 
            mark[v] += 1
            if mark[u] == 0
                push!(stack,u) 
                mark[u] = 1
            end
        end
        mark[v] -= 1
    end
    return mark
end