function isprime(n)
    if n==1
        return false
    end
    if n==2 || n==3
        return true
    end  

    for i in 2:isqrt(n)
        if n%i==0
            return false
        else
            if i ==2
                i+=1
            else
                i+=2
            end
        end
    end
    return true
end