# 2014-4: Space The Final Frontier
# Write a function that removes extraneous (leading, trailing, and multiple) spaces from a character vector.

Space ← ∘

⍤⤙≍ "this is a test" Space "  this  is a   test  "
⍤⤙≍ "" Space ""
⍤⤙≍ "hello world!" Space "hello world!"
⍤⤙≍ "" Space "  "
