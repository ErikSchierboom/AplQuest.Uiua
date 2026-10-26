# 2015-3: Farey Tale
# In mathematics, the Farey_sequence of order n is the sequence of completely reduced fractions between 0 and 1 which, when in lowest terms, have denominators less than or equal to n, arranged in order of increasing size. Each Farey sequence starts with the value 0, denoted by the fraction 0⁄1, and ends with the value 1, denoted by the fraction 1⁄1.
# 
# Write code that takes an integer argument and returns a 2x2 matrix of the terms in the Farey sequence of that order. Each element in the returned vector is itself a 2-element vector of numerator and denominator for the corresponding term.

# Solution
Solution ← (
  ⟜(⧅<2+₁⇡
    ▽⊸(¬⧆≡(˜÷°⊟))
    ⊏⍖⊸≡(÷°⊟)
    ⊂0_1)
  ⨬(∘|˜⊂1_1)±
)

# Tests
⍤⤙≍ [[0 1]] Solution 0

⍤⤙≍ [[0 1] [1 1]] Solution 1

⍤⤙≍ [[0 1] [1 5] [1 4] [1 3] [2 5] [1 2] [3 5] [2 3] [3 4] [4 5] [1 1]] Solution 5
