# 2014-6: Roll The Dice
# Write a function that takes an integer vector representing the sides of a number of dice and returns a 2 column matrix of the number of ways each possible total of the dice can be rolled.

DiceCombinations ← ⊕(⊟⊃⊢⧻)⊸⊛≡/+↯∞_2+1⇡

Expected ←
[ 2_1
  3_2
  4_3
  5_4
  6_5
  7_6
  8_5
  9_4
  10_3
  11_2
  12_1]
⍤⤙≍ Expected DiceCombinations [6 6] # 2 six-sided dice

Expected ←
[ 2_1
  3_2
  4_3
  5_4
  6_4
  7_4
  8_3
  9_2
  10_1
]
⍤⤙≍ Expected DiceCombinations 6 4 # a six-sided and a four-sided die

Expected ←
[ 1_1
  2_1
  3_1]
⍤⤙≍ Expected DiceCombinations 3 # a single 3-sided die

Expected ←
[0_1]
⍤⤙≍ Expected DiceCombinations [] # no dice
