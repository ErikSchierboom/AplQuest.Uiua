# 2016-7: 3s and 5s
# Write code that takes a numeric vector and returns all elements that are divisible by 3 or 5.

Solution ← ▽⊸(≡/↥=₀◿ ¤3_5)

⍤⤙≍ [3 5 6 9 10] Solution [1 2 3 4 5 6 7 8 9 10]
⍤⤙≍ [] Solution [] # should return an empty vector
