# 2022-4: In the Long One...
# Write a function that:
# - takes a right argument that is a Boolean scalar or vector.
# - returns the length of the longest sequence of consecutive 1s.

ConsecutiveOnes ← ⬚0/↥⊜⧻⊸∘

⍤⤙≍ 4 ConsecutiveOnes [1 1 1 0 1 1 0 0 1 1 1 1 0]
⍤⤙≍ 0 ConsecutiveOnes []
⍤⤙≍ 1 ConsecutiveOnes [1]
⍤⤙≍ 0 ConsecutiveOnes [0]
⍤⤙≍ 12 ConsecutiveOnes ▽ 12 [0 1 0 1]
