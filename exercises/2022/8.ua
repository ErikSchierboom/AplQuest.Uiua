# 2022-8: Let"s Split!
# Write a function that:
# 
# - takes a right argument that is a non-empty character vector or scalar.
# - takes a left argument that is a non-empty character vector or scalar.
# - returns a 2-element vector of character vectors in which the right argument is split immediately before the first occurence of any element in the left argument. 
#   If no left-argument element occurs in the right argument, then the split should happen after the last element of the right argument.

Split ← {⊃↙↘}⊸(⊢⍆˜⊗)

⍤⤙≍ {"Hell" "o World"} Split "do" "Hello World"
⍤⤙≍ {"ABCD" "EFGHIJKLMNOPQRSTUVWXYZ"} Split "KEI" +@A⇡26
⍤⤙≍ {"" "ABCDEFGHIJKLMNOPQRSTUVWXYZ"} Split "A" +@A⇡26
⍤⤙≍ {"ABCDEFGHIJKLMNOPQRSTUVWXYZ" ""} Split +@0⇡10 +@A⇡26
⍤⤙≍ {"Q" ""} Split +@0⇡10 "Q"
⍤⤙≍ {"" "Q"} Split +@A⇡126 "Q"
