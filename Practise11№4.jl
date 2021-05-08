using Plots
include("plane.jl") 
using .Vector2Ds 
function trasspasing(segments; kwargs...)
    p=plot(;kwargs...)
    for s in segments
        plot!(collect(s); kwargs...)
    end

    for i in 1:length(segments)
        A,B=segments[i]
        for j in i+1:length(segments)
            C,D=segments[j]
            if intersect((A,B),(C,D))!==nothing
                plot!(intersect((A,B),(C,D)),markershape=:xcross, markercolor=:red )
            end
        end
    end

    return p
end
