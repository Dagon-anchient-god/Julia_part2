function mydeleteat!(A,a)
    for i in a:length(A)-1
        A[i]=A[i+1]
    end
    A[length(A)]=Nothing
end

function myinsert!(A,a,c)
    b=A[end]
    for i in length(A)-1:a
        A[i+1]=A[i]
    end
    A[a]=c
    A=vcat(A,b)
    return A
end