# 2021-3: Multiplicity
# Write code that:
# - has a right argument Y which is an integer vector or scalar
# - has a left argument X which is also an integer vector or scalar
# - finds which elements of Y are multiples of each element of X and returns them as a vector (in the order of X) of vectors (in the order of Y).

Solution ← ⍚▽⊸(=0◿)⊙¤

Expected ← {[8 12 10 20 16 4 2 18 14 6] [8 12 20 16 4] [7 14] [12 15 3 18 9 6] [18 9]}
⍤⤙≍ Expected Solution [2 4 7 3 9] [5 7 8 1 12 10 20 16 11 4 2 15 3 18 14 19 13 9 17 6]

⍤⤙≍ {[3 6 9]} Solution [3] +1⇡10
⍤⤙≍ {[42] [42]} Solution [6 7] 42
⍤⤙≍ {[] [] []} Solution [2 3 5] [] # returns a vector of 3 empty vectors
⍤⤙≍ {} Solution [] +1⇡10           # returns an empty vector
