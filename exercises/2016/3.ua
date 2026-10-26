# 2016-3: Statistics - Mode
# Write code that takes a numeric vector or scalar as its argument and returns the mode (that is, the most common value) of the array. If more than one number occurs the greatest number of times, return all such numbers.

# Solution
Solution ← ▽⌕⊸/↥⊃(⊕⧻|⋅◴)⊸⊛⍆

# Tests
⍤⤙≍ [2] Solution [2 1 4 3 2 5 1 2]

⍤⤙≍ [] Solution [] # should return an empty vector

⍤⤙≍ [1 2] Solution [1 2 3 4 1 2]
