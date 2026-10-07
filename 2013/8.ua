# 2013-8: Go Forth And Multiply
# Write a function which produces a multiplication table.

MultiplicationTable ← ˙⊞× +1⇡

Expected ←
[ [1 2 3 4 5]
  [2 4 6 8 10]
  [3 6 9 12 15]
  [4 8 12 16 20]
  [5 10 15 20 25]]
⍤⤙≍ Expected MultiplicationTable 5

Expected ← [[1]]
⍤⤙≍ Expected MultiplicationTable 1 # should return a 1×1 matrix

⍤⤙≍ 0_0△ MultiplicationTable 0 # should return a 0×0 matrix
