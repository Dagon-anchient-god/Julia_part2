function types(A,spaces="")
    println(spaces,A)
    spaces*="\t"
    B=A
    a=subtypes(B)
    if length(a)==0
        return nothing
    end
    for i in 1:length(a)
        types(a[i],spaces)
    end
end