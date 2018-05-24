import StatsFuns.chisqccdf

## generic goodness of fit testing

function discreteProbabilities(pmf, low, high)
  n = high - low + 2
  probs = Vector{Float64}(undef, n)
  for k in low:high
    # probs[k-low+1] = pdf(dist, k)
    probs[k-low+1] = pmf(k)
  end
  probs[n] = 1 - sum(probs[1:n-1])
  return probs
end

function continuousProbabilities(cdf, low, high, h)
  divisions = Vector(low:h:high)
  n = length(divisions)
  probs = Vector{Float64}(undef, n)
  for i in 1:n-1
    probs[i] = cdf(divisions[i+1]) - cdf(divisions[i])
  end
  probs[n] = 1 - sum(probs[1:n-1])
  return probs
end

function testGOFMultinomial(probs::Vector{Float64}, counts::Vector{Int64})
  n::Int64 = sum(counts)
  es = n .* probs
  if minimum(es) < 10.0
    println("warning: minimum expected value of ", minimum(es),
      " in bin ", indmin(es), " of ", n)
  end
  testStatistic::Float64 = sum((counts .- es).^2 ./ es)
  # χ2 = Chisq(length(probs)-1)
  # pValue::Float64 = ccdf(χ2, testStatistic)
  pValue::Float64 = chisqccdf(length(probs)-1, testStatistic)
  return pValue
end

function testGOFDiscrete(pmf, sampler, low, high, N)
  n = high - low + 2
  probs = discreteProbabilities(pmf, low, high)
  counts = Vector{Int64}(undef, n)
  fill!(counts, 0)
  for i in 1:N
    v::Int64 = sampler()
    if v < low || v > high
      counts[n] += 1
    else
      counts[v-low+1] += 1
    end
  end
  return testGOFMultinomial(probs, counts)
end

function testGOFContinuous(cdf, sampler, low, high, h, N)
  divisions = Vector(low:h:high)
  n = length(divisions)
  probs = continuousProbabilities(cdf, low, high, h)
  counts = Vector{Int64}(undef, n)
  fill!(counts, 0)
  for i in 1:N
    v::Float64 = sampler()
    if v < divisions[1] || v > divisions[n]
      counts[n] += 1
    else
      bin = floor(Int64, (v - divisions[1])/h) + 1
      counts[bin] += 1
    end
  end
  return testGOFMultinomial(probs, counts)
end
