# 2019-8: Going the Distance
#
# Given a vector of (X Y) points, or a single X Y point, determine the total distance covered when travelling in a straight line from the first point to the next one, and so on until the last point, then returning directly back to the start.
# For example, given the points (A B C) ← (¯1.5 ¯1.5)(1.5 2.5)(1.5 ¯1.5), the distance A to B is 5, B to C is 4 and C back to A is 3, for a total of 12.

# Solution
Solution ← /+⧈₂(√+∩ⁿ₂⌵⊃(-∩⊢|-∩⊣)°⊟)⊂⟜⊢

# Tests
⍤⤙≍ 8 Solution [[1 ¯1] [1 3]]             # from A to B and back to A
⍤⤙≍ 4 Solution [[1 1] [1 2] [2 2] [2 1]]  # ⍝ from A to B to C to D to A
⍤⤙≍ 0 Solution [[5 5]]                    # staying where we are
⍤⤙≍ 5.656854249 ⁅₉ Solution [[1 1] [3 3]] # there and back again
