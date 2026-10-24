# 2022-10: Separation Anxiety
# Write a function that:
#
# - takes a right argument that is a character vector or scalar representing a valid non-negative integer.
# - takes a left argument that is a character scalar "separator" character.
# - returns a character vector that is a representation of the right argument formatted such that the separator character is found between trailing groups of 3 digits.
- # Note that the number of digits in the character representation might exceed the number of digits that can be represented as a 32-bit integer.

Solution ← ⍚(/◇⊂₃ ⊙(⊜□⌊+₁÷₃⇌°⊏))

⍤⤙≍ {"1" "10" "100" "1,000" "10,000" "100,000" "1,000,000" "10,000,000" "100,000,000" "1,000,000,000" "10,000,000,000"} Solution @, {"1" "10" "100" "1000" "10000" "100000" "1000000" "10000000" "100000000" "1000000000" "10000000000"}
⍤⤙≍ {"987.654.321.098.765.432.109.876.543.210.987.654.321.098.765.432.109.876.543.210"} Solution @. {↯[60]⇌+@0⇡10}
⍤⤙≍ {"9"} Solution @/ {"9"} # scalars and 1-element character vectors are equivalent
