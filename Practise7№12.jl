function ord(a,p)
    for i in 2:isqrt(p-1)
        if (p-1)%i==0
            if pow(a,i)%p==a
                return i
            elseif pow(a,(p-1)/i)%p==a
                return (p-1)/i
            end
        end
    end
    return p
end

function pow(a,b)
    k = b
    t = 1
    p = a
    while k>0
        if k%2==0 
            k ÷= 2
            p *= p 
        else
            k -= 1
            t *= p 
        end   
    end
    return t
end