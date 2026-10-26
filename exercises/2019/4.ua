# 2019-4: Knight Moves
# 
# Consider a chess board as an 8×8 matrix with square (1_1) in the upper left corner and square (8_8) in the lower right corner. 
# For those not familiar with the game of chess, the knight, generally depicted as a horse (♞), can move 2 spaces right or left and then 1 space up or down, or 2 spaces up or down and then 1 space right or left. 
# This means that a knight on square (5_4) can move to any of the indicated squares. 
# Given a 2-element vector representing the current square for a knight, return a vector of 2-element vectors representing (in any order) all the squares that the knight can move to.

# Solution
Solution ← ▽⊸≡(↧∩(↧⊃≥₁≤₈)°⊟)⍆+♭₂⊞×⧅₂≠1_2♭₂˙⊞⊂1_¯1¤

# Tests
⍤⤙≍ [[3 3] [3 5] [4 2] [4 6] [6 2] [6 6] [7 3] [7 5]] ⍆ Solution [5 4]

⍤⤙≍ [[2 3] [3 2]] ⍆ Solution [1 1]
