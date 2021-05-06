function minsort(A,b)
    A1 = (eltype(A))[]
    A2 = (eltype(A))[]
    A3 = (eltype(A))[]
    for i in firstindex(A):lastindex(A)
        if A[i]<b
            push!(A1,A[i])
        elseif A[i]==b
            push!(A2,A[i])
        else
            push!(A3,A[i])
        end
    end
    A=vcat(A1,A2,A3)
    return A
end

function minsort2(A,b)
    A1 = Array{eltype(A)}(undef,length(A))
    A2 = Array{eltype(A)}(undef,length(A))
    A3 = Array{eltype(A)}(undef,length(A))
    j=1
    k=1
    l=1
    for i in firstindex(A):lastindex(A)
        if A[i]<b
            A1[j]=A[i]
            j=j+1
        elseif A[i]==b
            A2[k]=A[i]
            k=k+1
        else
            A3[l]=A[i]
            l=l+1
        end
    end
    A[1:j-1]=A1[1:j-1]
    A[j:j+k-2]=A2[1:k-1]
    A[j+k-1:j+k+l-3]=A3[1:l-1]
    return A
end

function minsort3(A,b)
    i=1
    j=1
    l=lastindex(A)
    k=2
    while k<l
        while A[i]>=b
            if A[i]==b
                A[k],A[i]=A[i],A[k]
                k=k+1
            end
            if A[i]>b 
                A[l],A[i]=A[i],A[l]
                l=l-1
            end  
        end
        if j>k
            k=j+1
        end
        j=j+1
        i=i+1 
    end
    return A
end

