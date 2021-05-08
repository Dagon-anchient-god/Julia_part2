using Plots
include("plane.jl") 
using .Vector2Ds 
function plotsegments(segments; kwargs...)
    p=plot(;kwargs...)
    for s in segments
        plot!(collect(s); kwargs...)
    end
    return p
end


