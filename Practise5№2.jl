function evaldiffdpoly3(x,A)
    Q3 = 0 
    Q2 = 0
    Q′=0
    Q=0
    for a in @view A[1:end]
        Q3 = Q3*x+3Q2
        Q2 = Q2*x+2Q′
        Q′= Q′*x+Q
        Q = Q*x+a
    end
    return Q3
end

