function linsolve(A::AbstractMatrix,b::AbstractVector)
    x=zeros(Rational{Int}, length(b))
    for k in lastindex(x):-1:firstindex(x)
        x[k]=(b[k]-sum((@view A[k,k+1:lastindex(A,2)]).*(@view x[k+1:lastindex(x)])))/A[k,k]
    end
    return x
end