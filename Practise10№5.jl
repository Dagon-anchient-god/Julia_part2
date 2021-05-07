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

function newtonm(ff, x; ε_x=1e-8, ε_y=1e-8, nmaxiter=20)
    return newton(x->(y=ff(x); y[1]/y[2]), x; ε_x, ε_y, nmaxiter)
end

ff=(x->((x-cos(x),(1+sin(x)))))
x=0.5