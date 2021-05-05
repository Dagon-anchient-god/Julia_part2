function evaldiffdpoly2(x,A)
    Q2 = 0
    Q′=0
    Q=0
    for a in @view A[1:end]
        Q2 = Q2*x+2Q′
        Q′= Q′*x+Q
        Q = Q*x+a
    end
    return Q2
end

