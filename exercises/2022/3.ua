# 2022-3: Uniquely Qualified
# Write code that:
# 
# takes right and left arguments that are arrays of arbitrary rank, depth, and value.
# returns a vector of all elements that appear in either of the two argument arrays but not in both. The order of elements in the result is not significant.

# Solution
Solution ← ⊂⊃(▽¬⤚˜∊|▽¬⊸∊)

# Tests
⍤⤙≍ "DYOGP" Solution "DYALOG" "APL"
⍤⤙≍ {@D @Y @A @L @O @G "APL"} Solution "DYALOG" □"APL"
⍤⤙≍ [2 2 1 1 1] Solution [2 2] [1 1 1]
