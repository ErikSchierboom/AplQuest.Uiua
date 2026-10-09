# 2017-1: What an Odd Bunch
# Write a function that will return the first n odd natural numbers.

FirstNOdd ← ▽⊸◿₂ +1 ⇡×2

⍤⤙≍ [1 3 5 7 9] FirstNOdd 5
⍤⤙≍ [1] FirstNOdd 1
⍤⤙≍ [] FirstNOdd 0 # should return an empty vector
