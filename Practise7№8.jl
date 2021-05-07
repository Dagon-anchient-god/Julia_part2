function NOD(a,b)
    m = a
    n = b
    while n != 0
        m, n = n, m % n
    end
    return m
end
    