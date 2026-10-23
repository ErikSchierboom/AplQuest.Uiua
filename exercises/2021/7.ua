# 2021-7: Can You Feel the Magic?
# 
# Wikipedia states that, in recreational mathematics, a square array of numbers, usually positive integers, is called a magic square if the sums of the numbers in each row, each column, and both main diagonals are the same.
# 
# Write a function to test whether an array is a magic square. The function must:
# 
# - have a right argument that is a square matrix of integers (not necessarily all positive integers)
# - return 1 if the array represents a magic square, otherwise return 0

IsMagic ← =1⧻◴⊂₄⊃(≡/+|≡/+⍉|/+⌝⤸0_0|/+⌝⤸0_0⇌)

⍤⤙≍ 1 IsMagic ↯1_1 1
⍤⤙≍ 1 IsMagic ↯3_3 [4 9 2 3 5 7 8 1 6]
⍤⤙≍ 0 IsMagic ↯2_2 [1 2 3 4]
