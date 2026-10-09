# 2016-8: Separating Out the Negative
# Write a function that takes a numeric vector and returns a two element vector whose first element contains the values less than 0 (zero) in the vector and the second element contains all values greater than or equal to 0.

Partition ← ⊕□⊸≥₀

⍤⤙≍ {[¯2 ¯4 ¯5 ¯9] [0 1 3 6 7 8 10]} Partition [0 1 ¯2 3 ¯4 ¯5 6 7 8 ¯9 10]
⍤⤙≍ {[] [1 2 3 4 5]} Partition [1 2 3 4 5]
⍤⤙≍ {} Partition []
