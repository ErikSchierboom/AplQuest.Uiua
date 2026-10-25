# 2013-5: Identity Crisis
# An identity matrix is a square matrix (table) of 0 with 1's in the main diagonal.
# Write code which produces an n×n identity matrix.

# Solution
Solution ← ˙⊞=⇡

# Tests
Expected ← [[1 0 0 0 0]
            [0 1 0 0 0]
            [0 0 1 0 0]
            [0 0 0 1 0]
            [0 0 0 0 1]]
⍤⤙≍ Expected Solution 5

Expected ← [[1]]
⍤⤙≍ Expected Solution 1 # should return a 1×1 matrix

Expected ← ↯0_0 0
⍤⤙≍ Expected Solution 0 # should return a 0×0 matrix
