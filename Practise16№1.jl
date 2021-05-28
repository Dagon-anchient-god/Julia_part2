function komovo(G)
   min = (1:size(G,1))
   while !isnothing(p)
        p = next_permute!(p)
        m=0
        n=0
        m +=G[min[i];min[i+1]] for i in 1:length(min)-1
        n +=G[p[i];p[i+1]] for i in 1:length(p)-1
        if m>p
            min=p
        end
    return min
end

function next_permute!(p::AbstractVector)
    k = firstindex(p)-1
    for i in lastindex(p)-1:-1:firstindex(p)
        if p[i] < p[i+1]
            k=i
            break
        end
    end
    if k == firstindex(p)-1 
        return nothing
    end
    i=k+1
    while i < lastindex(p) && p[i+1] > p[k]
        i+=1
    end
    p[k], p[i] = p[i], p[k]
    reverse!(@view p[k+1:end])
    return p
end