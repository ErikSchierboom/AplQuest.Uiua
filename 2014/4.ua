# 2014-4: Space The Final Frontier
# Write a function that removes extraneous (leading, trailing, and multiple) spaces from a character array.

Space ← ▽⊸(↧↧⊃(\↥|⍜⇌\↥|⊂1⧈₂/↥)≠@ )

⍤⤙≍ "this is a test" Space "  this  is a   test  "
⍤⤙≍ "" Space "" # should return an empty array
⍤⤙≍ "hello world!" Space "hello world!"
⍤⤙≍ "" Space "  " # array of only spaces should return empty array
