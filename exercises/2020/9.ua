# 2020-9: Rise and Fall
# Write a function that, given a right argument which is an integer scalar or vector, returns a 1 if the values of the right argument conform to the following pattern (0 otherwise):
# The elements increase or stay the same until the "apex" (highest value) is reached
# After the apex, any remaining values decrease or remain the same

RiseAndFall ← ×∩/× ⊃(⧈≥↙|⧈≤↘) ⊸˜⊗⊸/↥

⍤⤙≍ 1 RiseAndFall [1 3 3 4 5 2 1]
⍤⤙≍ 1 RiseAndFall [42]
⍤⤙≍ 0 RiseAndFall [1 3 2 4]
⍤⤙≍ 1 RiseAndFall [23 23 23]
⍤⤙≍ 1 RiseAndFall []
