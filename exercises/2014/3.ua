# 2014-3: Tell a Fib
# Write code that takes an integer argument and returns that number of terms in the Fibonacci sequence.

# Solution
Solution ← ⍥◡+⊙(1 0)

# Tests
⍤⤙≍ [0 1 1 2 3 5 8 13 21 34] Solution 10
⍤⤙≍ [0] Solution 1
⍤⤙≍ [] Solution 0 # should return an empty array
