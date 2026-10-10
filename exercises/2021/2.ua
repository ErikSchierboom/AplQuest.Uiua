# 2021-2: Index-Of Modified
# Write a function that behaves like the APL index-of function R←X⍳Y except that it returns 0 instead of 1+≢X for elements of Y not found in X.

IndexOf ← +1 ⍜(▽|¯1◌) ⊸= ⊃⧻⊗

⍤⤙≍ [3 0 4] IndexOf "DYALOG" "APL"
⍤⤙≍ [5 2 0] IndexOf ↯5_5+@A⇡25 ["UVWXY" "FGHIJ" "XYZZY"]
