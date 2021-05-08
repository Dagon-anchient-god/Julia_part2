using Plots
include("plane.jl") 
using .Vector2Ds 
function vacmnog(segments)
    for i in 1:length(segments)-2
        A = norm(segments[i]-segments[i+1])
        B = norm(segments[i+1]-segments[i+2])
        if sin(A,B)<0
            return false
        end
    end
    A = norm(segments[length(segments)-1]-segments[length(segments)])
    B = norm(segments[length(segments)]-segments[length(segments)+1])
    if sin(A,B)<0
        return false
    end
    A = norm(segments[length(segments)]-segments[1])
    B = norm(segments[1]-segments[2])
    if sin(A,B)<0
        return false
    end
    return true
end
