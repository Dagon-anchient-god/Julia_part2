function divrem(a::AbstractVector,b::AbstractVector)
    answer = zeros(Rational{Int}, size(a))
    ost = a
    i=firstindex(ost)
    while length(ost)>=length(b)
        answer[i] = ost[firstindex(ost)] /b[1]
        if length(b)>2
            for j in 2:min(length(b),length(ost))
                ost[j]=ost[j]-round(b[j]*answer[i])
            end
        end
        deleteat!(ost,firstindex(ost))
        i=i+1
    end
    for j in range(length(answer), step=-1, stop=1)
        if answer[j] == 0//1
            deleteat!(answer,j)
        end
    end
    return answer, ost
end

divrem(a,b)