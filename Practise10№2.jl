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

newton(x->(x-cos(x))/(1+sin(x)), 0.5)