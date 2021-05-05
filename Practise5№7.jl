function diffpoly(a)
    for i in 1:length(a)-2
        a[i]=a[i]*(length(a)-i)
    end
    deleteat!(a,lastindex(a))
    return a
end

function intpoly(a)
    coeff=zeros(Rational{Int}, length(a)+1)
    for i in 1:length(a)-1
        coeff[i]=a[i]//(length(a)+1-i)
    end
    coeff[lastindex(a)]=a[lastindex(a)]
    return coeff
end