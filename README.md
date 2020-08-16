[![Build Status](https://travis-ci.org/issoupadrink/Tiny-Encryption-Algorithm.svg?branch=master)](https://travis-ci.org/issoupadrink/Tiny-Encryption-Algorithm)
[![codecov](https://codecov.io/gh/issoupadrink/Tiny-Encryption-Algorithm/branch/master/graph/badge.svg)](https://codecov.io/gh/issoupadrink/Tiny-Encryption-Algorithm)

# Tiny Encryption Algorithm

The Tiny Encryption Algorithm is a simple block cipher designed by David Wheeler and Roger Needham in 1994 at the Cambridge Computer Laboratory. Fun issue I found while implementing this is that Ruby does not have a nice way of dealing with C datatypes, so I had to write my own `uint32_t` type. 
