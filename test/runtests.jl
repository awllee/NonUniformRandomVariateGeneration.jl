using NonUniformRandomVariateGeneration
using Compat.Test
import Compat.undef

if VERSION < v"0.7-"
  seed! = srand
else
  import Random.seed!
end

include("goodness_of_fit.jl")

@testset "Binomial tests" begin
  include("binomial_test.jl")
end

@testset "Multinomial tests" begin
  include("multinomial_test.jl")
end

@testset "Poisson tests" begin
  include("poisson_test.jl")
end

@testset "Gamma tests" begin
  include("gamma_test.jl")
end

@testset "Beta tests" begin
  include("beta_test.jl")
end

@testset "Uniform tests" begin
  include("uniform_test.jl")
end

@testset "Categorical tests" begin
  include("categorical_test.jl")
end
