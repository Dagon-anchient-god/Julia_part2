function NOD(a,b)
    m = a
    n = b
    while n != 0
        m, n = n, m % n
    end
    return m
end       

function zerodivisors(m)
    answer=Vector{Int}[]
    for i in 2:m-1
        if NOD(i,m)!=1
            push!(answer,i)
        end
    end
    return answer
end

zerodivisors(::ResidueRing{m}) where m = ResidueRing{m}.zerodivisors(m)