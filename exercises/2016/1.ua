# 2016-1: Statistics - Mean
# Write a function that takes a numeric array as its right argument and returns the mean (average) of the array.

Solution ← ÷↥1⊃⧻/+

⍤⤙≍ 3.5 Solution [1 2 3 4 5 6]
⍤⤙≍ 0 Solution []               # the average of an empty vector is 0 
⍤⤙≍ 17 Solution 17              # your solution should work with a scalar argument
⍤⤙≍ [7 8 9] Solution ↯5_3 +1⇡15 # and average the columns of a matrix
Expected ← [
  [5 6 7]
  [8 9 10]
  [6 7 8]
]
⍤⤙≍ Expected Solution ↯[3 3 3] +1⇡15 # or the matrices of a 3D array etc.
