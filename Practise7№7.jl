function eller(n)
    result = 1
    answer,hw  = factor(n)
    for i in 1:length(answer)
        if hw[i]==1
            result *= answer[i]-1
        else
            result *=(answer[i]^hw[i]-answer[i]^(hw[i]-1))
        end
    end
    return result
end

function factor(n)
    answer=[]
    hw = []
    for i in eratosphen(n)
        if n%i==0
            push!(answer,i)
            push!(hw,1)
            n=n/i
            while n%i==0
                hw[end]+=1
                n=n/i
            end
        end
    end
    return answer,hw         
end

function eratosphen(n)
    ser=fill(true,n)
    ser[1]=false
    k=2
    while k !== nothing && k<n 
        ser[k^2:k:end] .= false
        k=findnext(ser, k+1)
    end
    return findall(ser)
end