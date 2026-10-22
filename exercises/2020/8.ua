# 2020-8: Zigzag Numbers
# A zigzag number is an integer in which the difference in magnitude of each pair of consecutive digits alternates from positive to negative or negative to positive.
# 
# Write a function that takes a single integer greater than or equal to 100 and less than 1015 as its right argument and returns a 1 if the integer is a zigzag number, 0 otherwise.

Zigzag ← /× ⧈(=2⌵-) ⧈(±-) ⊥₁₀

⍤⤙≍ 0 Zigzag 123
⍤⤙≍ 1 Zigzag 132
⍤⤙≍ 0 Zigzag 31115
⍤⤙≍ 1 Zigzag 3141514131415
