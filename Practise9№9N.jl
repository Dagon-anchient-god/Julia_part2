function inv(A)
    E=zeros(Float64, size(A))
    for i in firstindex(E,1):lastindex(E,1)
        E[i,i]=1
    end
    A=hcat(A,E)
    if issingular_convert!(A)===nothing
        return nothing
    end 
    for i in lastindex(A,1):-1:firstindex(A,1)
        for j in 1:lastindex(A,1)-1
            t=-A[i-1,i]/A[i,i]
            A[i,k:end] += t*(@view A[k,k:end])  
        end
    end

end

function det(A)
    issingular_convert!(A)
    dets=1.0
    z=0
    for i in firstindex(A,1):lastindex(A,1)
        z=i
        while isapproxzero(A[i,z]) 
            z+=1
        end
        dets=dets*A[i,z]
    end
    return dets
end


function issingular_convert!(A)
    for k in firstindex(A,1):lastindex(A,1)
        imax = argmax1(abs, @view A[k:end,k])+k-1 
        if isapproxzero(A[i,k])
            return nothing
        end
        colon_to_zeros!(A,k,imax)
    end
end

function colon_to_zeros!(A,k,imax)
    if imax != k
        A[k,:], A[imax,:] = A[imax,:], A[k,:] 
    end
    for i in k+1:lastindex(A,1)
        if isapproxzero(A[i,k]) 
            continue
        end
        t=-A[i,k]/A[k,k]
        A[i,k:end] += t*(@view A[k,k:end])  
    end
end

function argmax1(f::Function, a::AbstractVector)
    imax = firstindex(a)
    for i in firstindex(a)+1:lastindex(a)
        if f(a[i])>f(a[imax])
            imax = i
        end
    end
    return imax
end

function isapproxzero(a)
    isapprox(a,0.0; atol=1e-8)
end

A = [10.0 20.0 30.0 40.0 
     60.0 70.0 80.0 90.0 
     15.0 25.0 35.0 45.0 
     65.0 75.0 85.0 96.0 ]