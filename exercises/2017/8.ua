# 2017-8: Be the First 1
# Write a function that takes a Boolean vector or scalar and “turns off” all the 1s after the first 1.

TurnOffAfterFirstOne ← ×⊸(=₀⧆)

⍤⤙≍ [0 1 0 0 0 0 0] TurnOffAfterFirstOne [0 1 0 1 0 0 1]
⍤⤙≍ [] TurnOffAfterFirstOne []               # should return an empty vector      
⍤⤙≍ [0 0 0 0] TurnOffAfterFirstOne [0 0 0 0] # no 1's?  no problem!
