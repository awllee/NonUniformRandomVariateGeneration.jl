# NURVG

[![Build Status](https://travis-ci.org/awllee/NURVG.jl.svg?branch=master)](https://travis-ci.org/awllee/NURVG.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/ve73suox2nrlqvu9?svg=true)](https://ci.appveyor.com/project/awllee/nurvg-jl)
[![Coverage Status](https://coveralls.io/repos/awllee/NURVG.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/awllee/NURVG.jl?branch=master)
[![codecov.io](http://codecov.io/github/awllee/NURVG.jl/coverage.svg?branch=master)](http://codecov.io/github/awllee/NURVG.jl?branch=master)

This package provides some non-uniform random variate generation schemes. They  can use specified random number generators, and hence can be used in multi-threaded applications with different random number generators associated to each thread.

The current emphasis is on stateless algorithms with distribution parameters passed in.
