# 2016-1: Statistics - Mean
# Write a function that takes a numeric array as its right argument and returns the mean (average) of the array.

Mean ← ÷↥1⊃⧻/+

⍤⤙≍ 3.5 Mean [1 2 3 4 5 6]
⍤⤙≍ 0 Mean []               # the average of an empty vector is 0 
⍤⤙≍ 17 Mean 17              # your solution should work with a scalar argument
⍤⤙≍ [7 8 9] Mean ↯5_3 +1⇡15 # and average the columns of a matrix
Expected ← [
  [5 6 7]
  [8 9 10]
  [6 7 8]
]
⍤⤙≍ Expected Mean ↯[3 3 3] +1⇡15 # or the matrices of a 3D array etc.
