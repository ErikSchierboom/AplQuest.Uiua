# 2022-8: Let"s Split!
# Write code that:
# 
# - takes a second argument that is a non-empty character vector or scalar.
# - takes a first argument that is a non-empty character vector or scalar.
# - returns a 2-element vector of character vectors in which the second argument is split immediately before the first occurence of any element in the first argument. 
#   If no first argument element occurs in the second argument, then the split should happen after the last element of the second argument.

# Solution
Solution ← {⊃↙↘}⊸(⊢⍆˜⊗)

# Tests
⍤⤙≍ {"Hell" "o World"} Solution "do" "Hello World"

⍤⤙≍ {"ABCD" "EFGHIJKLMNOPQRSTUVWXYZ"} Solution "KEI" +@A⇡26

⍤⤙≍ {"" "ABCDEFGHIJKLMNOPQRSTUVWXYZ"} Solution "A" +@A⇡26

⍤⤙≍ {"ABCDEFGHIJKLMNOPQRSTUVWXYZ" ""} Solution +@0⇡10 +@A⇡26

⍤⤙≍ {"Q" ""} Solution +@0⇡10 "Q"

⍤⤙≍ {"" "Q"} Solution +@A⇡126 "Q"
