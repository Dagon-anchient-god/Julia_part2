function newton(r::Function, x; ε_x=1e-8, ε_y=1e-8, nmaxiter=20)
    xn=x
    xn1=xn-r(xn)
    while abs(xn1-xn)>ε_x && nmaxiter!=0 
        xn=xn1
        xn1=xn-r(xn)
        nmaxiter-=1
    end
    if nmaxiter==0
        return nothing
    else
        return xn
    end
end

function newton(polinom_coeff::Vector{Number}, x; ε_x=1e-8, ε_y=1e-8, nmaxiter=20)
   return newton(x->(y=evaldiffpoly(x, polynom_coeff); y[1]/y[2]),x; ε_x, ε_y, nmaxiter)
end

function evaldiffpoly(x,polynom_coeff)
    Q′=0
    Q=0
    for a in @view polynom_coeff[1:end]
        Q′=Q′x+Q
        Q=Q*x+a
    end
    return Q, Q′
end