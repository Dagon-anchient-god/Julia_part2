function find_all_max(a)
    all=[firstindex(a)]
    for i in firstindex(a)+1:lastindex(a)
        if a[i]>a[all[lastindex(all)]]
            all=[i]
        elseif a[i]==a[all[lastindex(all)]]
            push!(all, i)
        end
    end
    return all
end

