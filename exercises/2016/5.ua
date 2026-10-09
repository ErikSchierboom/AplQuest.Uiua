# 2016-5: You're Unique, Just Like Everyone Else
# Write a function that takes a vector as its right argument and returns elements that occur only once in the vector.

Unique ← ▽=1⊃(⊕⧻|⋅◴)⊸⊛

⍤⤙≍ [1 2 3 4 5] Unique [1 2 3 4 5]
⍤⤙≍ [5] Unique [1 2 3 4 5 4 3 2 1]
⍤⤙≍ "he wrd" Unique "hello world"
