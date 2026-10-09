# 2017-2: Good Evening
# Write a function that takes an integer array and replaces all the odd numbers with the next greater even number.

NextGreaterEven ← +⊸◿₂

⍤⤙≍ [2 2 4 4 6] NextGreaterEven [1 2 3 4 5]
⍤⤙≍ [] NextGreaterEven [] # should return an empty vector

Expected ← [[2 2 4 4]
            [6 6 8 8]
            [10 10 12 12]
            [14 14 16 16]]
⍤⤙≍ Expected NextGreaterEven↯4_4 +1⇡16 # should work with arrays of any rank
