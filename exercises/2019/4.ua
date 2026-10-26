# 2019-4: Knight Moves
# 1_1	1_2	1_3	1_4	1_5	1_6	1_7	1_8
# 2_1	2_2	2_3	2_4	2_5	2_6	2_7	2_8
# 3_1	3_2	3_3	3_4	3_5	3_6	3_7	3_8
# 4_1	4_2	4_3	4_4	4_5	4_6	4_7	4_8
# 5_1	5_2	5_3	5_4	5_5	5_6	5_7	5_8
# 6_1	6_2	6_3	6_4	6_5	6_6	6_7	6_8
# 7_1	7_2	7_3	7_4	7_5	7_6	7_7	7_8
# 8_1	8_2	8_3	8_4	8_5	8_6	8_7	8_8
# Consider a chess board as an 8×8 matrix with square (1_1) in the upper left corner and square (8_8) in the lower right corner. 
# For those not familiar with the game of chess, the knight, generally depicted as a horse (♞), can move 2 spaces right or left and then 1 space up or down, or 2 spaces up or down and then 1 space right or left. 
# This means that a knight on square (5_4) can move to any of the indicated squares. 
# Given a 2-element vector representing the current square for a knight, return a vector of 2-element vectors representing (in any order) all the squares that the knight can move to.

# Solution
Solution ← ▽⊸≡(↧∩(↧⊃≥₁≤₈)°⊟)⍆+♭₂⊞×⧅₂≠1_2♭₂˙⊞⊂1_¯1¤

# Tests
⍤⤙≍ [[3 3] [3 5] [4 2] [4 6] [6 2] [6 6] [7 3] [7 5]] Solution [5 4]

⍤⤙≍ [[2 3] [3 2]] Solution [1 1]
