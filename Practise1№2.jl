function calcsortkey(a, key_series, key_values)
    vector_vector_indexes = calcsortindexes(key_series, key_values)
    b=similar(a) 
    j=1
    for vector_indexes in vector_vector_indexes  
        for i in vector_indexes
            b[j] = a[i]
            j+=1
        end
    end
    return b
end

function calcsortindexes(key_series, key_values) 
    vector_vector_indexes=[Int[] for _ in key_values]

    for i in eachindex(key_series)
        k=indexvalue(key_series[i], key_values)
        push!(vector_vector_indexes[k], i)
    end

    return vector_vector_indexes
end

function indexvalue(v, values::Vector)
    findfirst(x->x==v, values)
end


function calcsort_numzeros(a)
    b=[@view a[:,j] for j in 1:size(a,2)]
    k_s=[length(findall(b[j].== 0)) for j in 1:length(b)]
    b = calcsortkey(b, k_s, collect(0:size(a,1)))
    return  hcat(b...)
end