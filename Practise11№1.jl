include("plane.jl") 
using .Vector2Ds 
function randpoints(random::Function, num::Integer)
    return[(random(),random()) for _ in 1:num]
end
