function strongly_connected(graph)
    for s in 1:length(graph)
        if all_achievable(s, graph) == false
            return false
        end
    end
    return true
end

function all_achievable(started_ver::Integer, graph)
    mark = zeros(Bool,length(graph))
    attempt_achievable!(started_ver, graph, mark)
    return count(m->m==0, mark) == 0 
end

function attempt_achievable!(startver, graph, mark) 
    stack  = [startver]
    mark[startver] = 1
    while !isempty(stack)
        v = pop!(stack)
        for u in graph[v]
            if mark[u] == 0
                push!(stack,u)
                mark[u] = 1
            end
        end
    end
end