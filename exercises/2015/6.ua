# 2015-6: Hey! This is My Space
# Write code that takes, as each of its first and second arguments, a pair of co-ordinates representing diagonally opposite corners of two rectangles and returns a 1 if the rectangles overlap.
#  The co-ordinates could be either (upper-left, lower-right) or (upper-right, lower left).

# Solution
Solution ← /↧<°⊟⊏[6_2_7_3 0_4_1_5]⊂∩(⍆♭)

# Tests
⍤⤙≍ 1 Solution [[1 1][5 5]] [[3 3][7 7]]

⍤⤙≍ 1 Solution [[1 1][5 5]] [[5 5][1 1]]

⍤⤙≍ 0 Solution [[1 1][3 3]] [[4 4][7 7]]

⍤⤙≍ 1 Solution [[1.1 1.1][5.5 5.5]] [[3.3 3.3][4.4 4.4]]
