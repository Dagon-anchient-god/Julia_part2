function SLA(A)
    b=Array{Union{Missing,  Float64},1}(missing,size(A,1))
    if size(A,1)!=size(A,2)
        return b
    end
    b[firstindex(b):lastindex(b)].=0.0
    b[lastindex(b)]=1
    for i in lastindex(A,1)+1:-1:firstindex(A,1)
        msla!(i,length(b),b,A)
    end
    b[lastindex(b)]=1*A[lastindex(A)]
    return b
end

function msla!(k,d,b,A)
    for i in  k+1:d
        b[k] += -(b[i]*A[k,i])/A[i-1,i-1]
    end
end
