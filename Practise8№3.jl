using Random
using BenchmarkTools
function srav()
    array = []
    for i in 1:999999
        push!(array, rand())
    end
    array2 = array
    array3 = array
    @btime sort!(array)
    @btime mergesort!(array2)
    @btime mergesort1!(array3)
end
#В результате 
#sort! 38.910 ns (1 allocation: 80 bytes)
#mergesort! 18.937 ns (0 allocations: 0 bytes)
#mergesort1! 17.835 ns (0 allocations: 0 bytes)
#Сортировка без рекурсий оказалась самой быстрой

function mergesort1!(a)
    k = 1
    while k < length(a)
        for i in 1:2k:length(a)
            if (i + k - 1 < length(a) < i + 2k -1)
                b = merge2(a[i:i+k-1], a[i+k : lastindex(a)])
                a[i:lastindex(a)] = b
            elseif ( i + 2k -1 <= length(a))
                b = merge2(a[i:i+k-1], a[i+k : i+2k - 1])
                a[i:i+2k-1] = b
            end
        end
        k *= 2
    end

    return a
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

function mergesort!(a)
    if length(a)<=1
        return a
    end
    a1 = mergesort!(a[begin:end÷2]) 
    a2 = mergesort!(a[end÷2+1:end])
    return merge2(a1, a2)
end