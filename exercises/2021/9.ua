# 2021-9: In the Long Run
# Write a function that:
# 
# has a right argument that is a numeric vector of 2 or more elements representing daily prices of a stock.
# returns an integer singleton that represents the highest number of consecutive days where the price increased, decreased, or remained the same, relative to the previous day.

Solution ← /↥⊜⧻⊸(⊂0+2±⧈-)

⍤⤙≍ 3 Solution [1 2 3 5 5 5 6 4 3]
⍤⤙≍ 4 Solution [1 2 3 4 4 4 4 4 5 4 3]
⍤⤙≍ 1 Solution [1 2]
