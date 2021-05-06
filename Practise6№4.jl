function binomial_coeffs(n::Integer)
    c=NTuple{0,Int}() 
    for _ in 1:n
        c=(1, (c[1:end-1] .+ c[2:end])..., 1)
    end
    return c
end
