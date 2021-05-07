function  inv(m,n)
    a = m
    b = n
    u_a = 1
    v_b = 1
    u_b = 0
    v_a = 0

    if NOD(a,b)!=1
        return Nothing
    end

    while b != 0
        k, r = divrem(a,b)
        a, b = b, r 
        u, v = u_a, v_a
        u_a, v_a = u_b, u_a
        u_b, v_b = u-k*u_b, v-k*v_b
    end
    while u_a<0
        u_a+=n
    end
    return u_a
end

function NOD(a,b)
    m = a
    n = b
    while n != 0
        m, n = n, m % n
    end
    return m
end       

Base.inv(a::ResidueRing{m}) where m = ResidueRing{m}.inv(a,m) 