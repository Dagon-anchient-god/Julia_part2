function val(graph)
    answer=[]
    for i in firstindex(graph):lastindex(graph)
        push!(answer,length(graph[1]))
    end
    return answer
end