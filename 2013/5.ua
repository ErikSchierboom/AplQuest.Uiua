# 2013-5: Identity Crisis
# An identity matrix is a square matrix (table) of 0 with 1's in the main diagonal.
# Write a function which produces an n×n identity matrix.

IdentityMatrix ← ˙⊞=⇡

Expected ←
[ [1 0 0 0 0]
  [0 1 0 0 0]
  [0 0 1 0 0]
  [0 0 0 1 0]
  [0 0 0 0 1]]
⍤⤙≍ Expected IdentityMatrix 5

Expected ←
[[1]]
⍤⤙≍ Expected IdentityMatrix 1 # should return a 1×1 matrix

Expected ← ↯0_0 0
⍤⤙≍ Expected IdentityMatrix 0 # should return a 0×0 matrix
