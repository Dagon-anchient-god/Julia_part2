import Pkg
Pkg.add("Plots")
using Plots
include("plane.jl") 
using .Vector2Ds 
points = randpoints(rand, 30)
scatter(points; legend = false) 
