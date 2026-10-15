# 2017-9: Double Trouble
# Write a function that takes a character vector or scalar and returns a Boolean vector indicating anywhere an element is followed by an element of the same value.

Doubles ← ↘₁⬚@\0⧈₂/=

⍤⤙≍ [0 1 0 1 0 1 0 0 0 0] Doubles "bookkeeper"
⍤⤙≍ [] Doubles "" # should return an empty vector
⍤⤙≍ [1 1 1 1 1 0] Doubles "aaaaaa"
⍤⤙≍ [0] Doubles "d"
