function shortest_path(start_ver, finish_ver, graph) 
    n = length(graph)
    dist = zeros(Int, n)
    queue  = [start_ver] 
    dist[start_ver] = 1 
    parent = fill(-1, n)
    while !isempty(queue)
        v = popfirst!(queue) 
        if v == finish_ver return get_shortest_path(parent, finish_ver) end
        for u in graph[v] 
            if dist[u] == 0 
                push!(queue, u) 
                dist[u] = dist[v]+1 
                parent[u] = v
            end
        end
    end
end

function get_shortest_path(parent, finish_ver)
    path=[]
    i = finish_ver
    while parent[i] != -1
        push!(path, i)
        i = parent[i]
    end
    return reverse(path)
end