function myreverse!(A)
    a=firstindex(A)
    b=lastindex(A)
    count=0
    while (a<b)
        A[a+count],A[b+count]=A[b+count],A[a+count]
        count+=1
    end   
end