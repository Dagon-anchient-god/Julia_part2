function maxpartsum(a)
    sum=0
    mins = 0
    answer = 0
    for i in 1:lastindex(a)
        sum= sum+a[i]
        answer = max(answer, sum - mins )
        mins = min(sum, mins)
    end
    return answer
end

function maxpartsum_in(a)
    sum=0
    mins = 0
    answer = 0
    k=0
    m=0
    min_p =0
    for i in 1:lastindex(a)
        sum= sum+a[i]
        curr = sum - mins

        if curr > answer
            answer = curr
            k = min_p +1
            m = i
        end

        if sum < mins
            mins = sum    
            min_p = i
        end
    end

    return k, m
end