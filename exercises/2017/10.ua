# 2017-10: Squaring Off
# Write a function that will reshape a given array into the smallest square matrix that will contain all the elements of the argument, padding with additional elements if necessary.
# The pad element should be 0.

PaddedSquare ← ⬚0↯⊸([⟜∘⌈√⧻])

Expected ← [[1 2]
            [3 4]]
⍤⤙≍ Expected PaddedSquare [1 2 3 4]

Expected ← [[1 2 3]
            [4 5 0]
            [0 0 0]]
⍤⤙≍ Expected PaddedSquare [1 2 3 4 5]

⍤⤙≍ [[100]] PaddedSquare [100] # should return a 1×1 matrix 
⍤⤙≍ 0_0△ PaddedSquare []       # should return a 0×0 matrix
