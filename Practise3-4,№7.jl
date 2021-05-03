function mydeleteat!(A,a)
    for i in a:length(A)-1
        A[i]=A[i+1]
    end
    B = Vector{eltype(A)}(undef,(length(A)-1))
    for i in 1:length(A)-1
        B[i]=A[i]
    end
    A=B
end

function myinsert!(A,a,c)
    b=A[end]
    for i in  range(length(A)-1, step=-1, stop=a)
        A[i+1]=A[i]
    end
    A[a]=c
    A=vcat(A,b)
    return A
end

