function sortkey(key_values, a)
    indperm=sortperm(key_values)
    return a[indperm]
end

a=[6,8,3,5,1,2,4,7]
b=a
sortkey(b,a)

function sortkey(f::Function, a)
    sortkey(f(a), a)
end

function MZsortkey(f::Function, a::Matrix)
    colons=[@view a[:,j] for j in 1:size(a,2)]
    colons=sortkey(f, colons)
    a=hcat(colons...)
    return a
end

function zero(a)
    n=[length(findall(a[j].== 0)) for j in 1:length(a)]
    return n
end

function summa!(a)
    m = zeros(Int, size(a))
    for i in 1:length(a)
        for j in 1:length(a[i])
        m[i]=m[i]+a[i][j]
        end
    end
    return m
end
a=[10  0 30
40 0 60
70 0 0
0 100 110]
MZsortkey(zero,a)
MZsortkey(summa!,a)
