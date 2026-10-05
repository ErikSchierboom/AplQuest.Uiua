# 2013-7: Float Your Boat
# Write a function which selects the floating point (non-integer) numbers from a numeric vector.

Floats ← ▽⊸≠⊸⁅
⍤⤙≍ [14.2 3.1 ¯1.1] Floats [14.2 9 ¯3 3.1 0 ¯1.1]
⍤⤙≍ [] Floats [1 3 5]
⍤⤙≍ [3.1415] Floats [3.1415]
