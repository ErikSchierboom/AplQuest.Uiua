# 2022-6: Pyramid Scheme
# Write a monadic function that:
# - takes an argument n that is an integer scalar in the range 0-100.
# - returns a square matrix "pyramid" with 0⌈¯1+2×n rows and columns of n increasing concentric levels.
# - By this we mean that the center element of the matrix will be n, surrounded on all sides by n-1.

# Solution
Solution ← ˙⊞↧⊂⟜(↘₁⇌)+₁⇡

# Tests
Expected ← [[1 1 1 1 1]
            [1 2 2 2 1]
            [1 2 3 2 1]
            [1 2 2 2 1]
            [1 1 1 1 1]]
⍤⤙≍ Expected Solution 3

Expected ← [[1 1 1 1 1 1 1 1 1]
            [1 2 2 2 2 2 2 2 1]
            [1 2 3 3 3 3 3 2 1]
            [1 2 3 4 4 4 3 2 1]
            [1 2 3 4 5 4 3 2 1]
            [1 2 3 4 4 4 3 2 1]
            [1 2 3 3 3 3 3 2 1]
            [1 2 2 2 2 2 2 2 1]
            [1 1 1 1 1 1 1 1 1]]
⍤⤙≍ Expected Solution 5

⍤⤙≍ [[1]] Solution 1 # ⍝ should return 1 1⍴1

⍤⤙≍ 0_0△ Solution 0 # should return 0 0⍴0
