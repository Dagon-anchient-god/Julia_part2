function cosins(x)
    xx=x^2
    a=1
    k=1
    s=typeof(x)(0)
    while abs(a)>0.000001
        s+=a
        a=-a*xx/(2k)/(2k-1)
        k+=1
    end
    return s
end
