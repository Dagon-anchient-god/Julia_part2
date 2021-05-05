import Pkg
Pkg.add("Polynomials")
using Polynomials
using .Polynoms
function diff(p::Polynomialx,x; ord=2)
    Q = eval_poly(x,p)
    Qn = eval_polyN(x,p,ord)
    return Q-Qn
end

function eval_poly(x,A)
    Q = first(A) 
    for a in @view A[2:end]
        Q=Q*x+a
    end
    return Q
end