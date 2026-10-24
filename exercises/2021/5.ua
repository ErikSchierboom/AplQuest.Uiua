# 2021-5: Rect-ify
# Suppose you have a number of trees that you want to plant in a rectangular pattern with complete rows and columns, meaning all rows have the same number of trees. You also want that rectangular pattern to be as "square" as possible, meaning there is a minimal difference between the number of rows and columns in the pattern.
# 
# Write a function that: - has a right argument N which is a positive integer less than or equal to 1,000,000. - returns a 2-element integer vector R representing the rows and columns of the rectangle such that: - N=×/R meaning N equals the number of rows × the number of columns (you planted all the trees!) - ≤/R meaning the number of rows is less than or equal to the number of columns - |-/R is minimal, meaning the difference between the elements of R is as small as possible

Solution ← ≡(↙₂↘⊃(-1⧻|▽2)+1⊚=0◿⊸(+1⇡))

⍤⤙≍ [3 4] Solution 12
⍤⤙≍ [4 4] Solution 16

Expected ← [[1 1] [1 2] [1 3] [2 2] [1 5] [2 3] [1 7] [2 4] [3 3] [2 5] [1 11] [3 4] [1 13] [2 7] [3 5] [4 4] [1 17] [3 6] [1 19]]
⍤⤙≍ Expected Solution +1⇡19

⍤⤙≍ [[999 1001] [1000 1000]] Solution [999999 1000000]
