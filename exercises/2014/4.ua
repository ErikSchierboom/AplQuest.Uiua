# 2014-4: Space The Final Frontier
# Write code that removes extraneous (leading, trailing, and multiple) spaces from a character array.

# Solution
Solution ← ▽⊸(↧↧⊃(\↥|⍜⇌\↥|⊂1⧈₂/↥)≠@ )

# Tests
⍤⤙≍ "this is a test" Solution "  this  is a   test  "

⍤⤙≍ "" Solution "" # should return an empty array

⍤⤙≍ "hello world!" Solution "hello world!"

⍤⤙≍ "" Solution "  " # array of only spaces should return empty array
