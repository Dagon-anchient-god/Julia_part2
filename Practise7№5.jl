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