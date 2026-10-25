# 2016-8: Separating Out the Negative
# Write code that takes a numeric vector and returns a two element vector whose first element contains the values less than 0 (zero) in the vector and the second element contains all values greater than or equal to 0.

# Solution
Solution ← ⊕□⊸≥₀

# Tests
⍤⤙≍ {[¯2 ¯4 ¯5 ¯9] [0 1 3 6 7 8 10]} Solution [0 1 ¯2 3 ¯4 ¯5 6 7 8 ¯9 10]
⍤⤙≍ {[] [1 2 3 4 5]} Solution [1 2 3 4 5]
⍤⤙≍ {} Solution []
