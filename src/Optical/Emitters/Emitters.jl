#=
Emitters are defined by Pixels and SpatialLayouts. An emitter has a spectrum, and an optical power distribution over the hemisphere. 
These are intrinsic physical properties of the emitter.
=#

module Emitters
export generate, visual_size, apply
export right, up, forward
export Spectrum, Directions, Origins, AngularPower, Sources

using ...OpticSim, ..Geometry
using LinearAlgebra

# define some utility functions 
right(t::OpticSim.Geometry.Transform{<:Real}) = normalize(Vec3(t[1,1], t[2,1], t[3,1]))
up(t::OpticSim.Geometry.Transform{<:Real}) = normalize(Vec3(t[1,2], t[2,2], t[3,2]))
forward(t::OpticSim.Geometry.Transform{<:Real}) = normalize(Vec3(t[1,3], t[2,3], t[3,3]))
OpticSim.origin(t::OpticSim.Geometry.Transform{<:Real}) = Vec3(t[1,4], t[2,4], t[3,4])

# defining name placeholders to override in nested modules

"""
    generate(???)

[TODO]
"""
generate() = 0

"""
    visual_size(???)

[TODO]
"""
visual_size() = 0

"""
    apply(???)

[TODO] Returns ray power
"""
apply() = 0

include("Spectrum.jl")
include("Directions.jl")
include("Origins.jl")
include("AngularPower.jl")
include("Sources.jl")

end # module Emitters

export Emitters
