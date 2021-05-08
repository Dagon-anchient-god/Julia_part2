function mergesort!(a)
    if length(a)<=1
        return a
    end
    a1 = mergesort!(a[begin:end÷2]) 
    a2 = mergesort!(a[end÷2+1:end])
    return merge2(a1, a2)
end

function merge2(A,B)
    C=promote_type(eltype(A),eltype(B))[]
    j=1
    i=1
    z=1
    flag1=0
    flag2=0
    while z <=length(A)+length(B)

        while i<=length(A) && A[i]<=B[j]
            push!(C,A[i])
            i=i+1
            z=z+1
        end

        if i>length(A)
            i=i-1
            flag1=1
        end

        while j<=length(B)  && B[j]<A[i]
            push!(C,B[j])
            j=j+1
            z=z+1
        end

        if j>length(B)
            j=j-1
            flag2=1
        end

        if  flag1==1
            for f in j:length(B)
                push!(C,B[j])
                j=j+1
                z=z+1
            end
        end

        if  flag2==1
            for f in i:length(A)
                push!(C,A[i])
                i=i+1
                z=z+1
            end
        end
    
    end
    return C
end
A=[5,2,7,1,3,6,4]