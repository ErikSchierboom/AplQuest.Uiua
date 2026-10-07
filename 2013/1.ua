# 2013-1: Seems a Bit Odd To Me
# Write a function to produce a array of the ⊢ n odd numbers.

FirstNOdd ← ▽⊸◿₂ +1 ⇡×2

⍤⤙≍ [1 3 5 7 9 11 13 15 17 19] FirstNOdd 10
⍤⤙≍ [1] FirstNOdd 1
⍤⤙≍ [] FirstNOdd 0 # this should return an empty array
