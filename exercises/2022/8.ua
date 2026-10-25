# 2022-8: Let"s Split!
# Write code that:
# 
# - takes a right argument that is a non-empty character vector or scalar.
# - takes a left argument that is a non-empty character vector or scalar.
# - returns a 2-element vector of character vectors in which the right argument is split immediately before the first occurence of any element in the left argument. 
#   If no left-argument element occurs in the right argument, then the split should happen after the last element of the right argument.

Solution ← {⊃↙↘}⊸(⊢⍆˜⊗)

⍤⤙≍ {"Hell" "o World"} Solution "do" "Hello World"
⍤⤙≍ {"ABCD" "EFGHIJKLMNOPQRSTUVWXYZ"} Solution "KEI" +@A⇡26
⍤⤙≍ {"" "ABCDEFGHIJKLMNOPQRSTUVWXYZ"} Solution "A" +@A⇡26
⍤⤙≍ {"ABCDEFGHIJKLMNOPQRSTUVWXYZ" ""} Solution +@0⇡10 +@A⇡26
⍤⤙≍ {"Q" ""} Solution +@0⇡10 "Q"
⍤⤙≍ {"" "Q"} Solution +@A⇡126 "Q"
