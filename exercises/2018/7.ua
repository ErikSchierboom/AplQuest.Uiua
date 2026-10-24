# 2018-7: Unconditionally Shifty
# Logical bitwise shifting is a common operation where bits in a fixed width field are moved to the left or right by a specified amount, N, causing N bits to be "shifted out" at one end and N 0's to be filled in at the other end.
#
# For example, shifting the following vector by 3
# 1 0 1 1 1 0 1 1
# would result in
# 0 0 0 1 0 1 1 1
# and shifting by ¯3 would result in
# 1 1 0 1 1 0 0 0

# Write a function that given a right argument of a Boolean scalar or vector, and left argument scalar integer of the shift amount, returns an appropriately shifted transformation of the right argument.

Solution ← ⬚0↻¯

⍤⤙≍ [0 0 0 1 0 1 1 1] Solution 3 [1 0 1 1 1 0 1 1]
⍤⤙≍ [1 1 0 1 1 0 0 0] Solution ¯3 [1 0 1 1 1 0 1 1]
⍤⤙≍ [] Solution 5 [] # result is an empty vector      
⍤⤙≍ [1 0 1 1 1 0 1 1] Solution 0 [1 0 1 1 1 0 1 1]
⍤⤙≍ [0] Solution 3 [1]
