# NURVG

[![Build Status](https://travis-ci.org/awllee/NURVG.jl.svg?branch=master)](https://travis-ci.org/awllee/NURVG.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/ve73suox2nrlqvu9?svg=true)](https://ci.appveyor.com/project/awllee/nurvg-jl)
[![Coverage Status](https://coveralls.io/repos/awllee/NURVG.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/awllee/NURVG.jl?branch=master)
[![codecov.io](http://codecov.io/github/awllee/NURVG.jl/coverage.svg?branch=master)](http://codecov.io/github/awllee/NURVG.jl?branch=master)

This package provides some non-uniform random variate generation schemes. They  can use specified random number generators, and hence can be used in multi-threaded applications with different random number generators associated to each thread.

The current emphasis is on stateless algorithms with distribution parameters passed in.

Currently includes generation of the following random variates:

* Binomial: W. Hörmann. The Generation of Binomial Random Variates, Journal of Statistical Computation and Simulation 46, 1993.

* Multinomial: using Binomial random variates.

* Gamma: Marsaglia, G. and Tsang, W.W., 2000. A simple method for generating gamma variables. ACM Transactions on Mathematical Software (TOMS), 26(3).

* Beta: using Gamma random variates.

* Poisson: Ahrens, J.H. and Dieter, U., 1982. Computer generation of Poisson deviates from modified normal distributions. ACM Transactions on Mathematical Software (TOMS), 8(2), pp. 163-179.

* Sorted Uniforms: Uniform spacing method, Algorithm B, p. 214 of L. Devroye. Non-uniform random variate generation. 1986.

* Categorical: using inversion with sorted uniforms. This method can be faster than the alias method, depending on the setting.
