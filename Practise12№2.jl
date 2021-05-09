function graham(segments)
    p=plot(;linecolor=:green, markershape=:circle, markercolor=:blue)
    n =  length(segments)
    temp = segments
    for i in 2:n
        a,b=temp[1]
        c,d=temp[i]
        if c<a
            temp[i], temp[1] = temp[1], temp[i]  
        end
    end
    for i in 2:n
        j = i
        while j>1 && (rotate(temp[0],temp[j-1],temp[j])<0) 
            temp[j], temp[j-1] = temp[j-1], temp[j]
            j -= 1
        end
    end
    H = [temp[1],temp[2]]
    for i in 2:n
        while rotate(H[lastindex(H)-1],H[lastindex(H)],temp[i])<0
            deleteat!(H,lastindex(H))
        end
        push!(H,temp[i])
    end
    scatter!(H,markershape=:cross,markercolor=:red )
    scatter!(segments,markershape=:circle,markercolor=:blue )
    return H
end 

function rotate(A,B,C)
    a0,a1=A
    b0,b1=B
    c0,c1=C
  return (b0-a0)*(c1-b1)-(b1-a1)*(c0-b0)
end 