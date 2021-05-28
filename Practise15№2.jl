function convert(tree)
    T=typeof(tree[end])
    connect_tree = Dict{T,Vector{T}}()
    
    function recurs_trace(tree)
        connect_tree[tree[end]]=[]
        for subtree in tree[1:end-1] 
            push!(connect_tree[tree[end]], recurs_trace(subtree))
        end
        return tree[end]
    end

    recurs_trace(tree)
    return connect_tree
end
