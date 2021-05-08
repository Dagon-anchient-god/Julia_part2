using Plots
include("plane.jl") 
using .Vector2Ds 
function lines(segments,line)
    p=plot(;linecolor=:green, markershape=:circle, markercolor=:blue)
    for s in line
        plot!(collect(s); linecolor=:green, markershape=:circle, markercolor=:blue)
    end
    A,B=line[1]

    scatter!(segments[1],markershape=:circle,markercolor=:blue ; legend = false) 

    for i in 2:length(segments)
        if is_one(segments[1],segments[i],A,B)==true
            scatter!(segments[i],markershape=:circle,markercolor=:blue ; legend = false)
        else
            scatter!(segments[i],markershape=:circle,markercolor=:red ; legend = false)
        end
    end

    return p
end

function is_one(C, D, A, B) 
    l=B.-A
    return sin(l,C.-A)*sin(l,D.-A)>0
end
