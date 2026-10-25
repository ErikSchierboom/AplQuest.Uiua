# 2020-8: Zigzag Numbers
# A zigzag number is an integer in which the difference in magnitude of each pair of consecutive digits alternates from positive to negative or negative to positive.
# 
# Write code that takes a single integer greater than or equal to 100 and less than 1015 as its argument and returns a 1 if the integer is a zigzag number, 0 otherwise.

# Solution
Solution ← /× ⧈(=2⌵-) ⧈(±-) ⊥₁₀

# Tests
⍤⤙≍ 0 Solution 123
⍤⤙≍ 1 Solution 132
⍤⤙≍ 0 Solution 31115
⍤⤙≍ 1 Solution 3141514131415
