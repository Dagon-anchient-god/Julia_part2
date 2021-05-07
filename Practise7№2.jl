function fibonacci(n)
    answer = pow(n-1)
    return answer
end


function pow(b)
    k = b
    t = [1 1 
        1 1]
    p = [1 1 
         1 0]
    while k>0
        if k%2==0 
            k ÷= 2
            p *= p 
        else
            k -= 1
            t *= p 
        end   
    end
    return t[2,2]
end