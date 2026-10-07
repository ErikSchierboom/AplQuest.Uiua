# 2013-4: Keeping Things In Balance
# Write a function which returns a 1 if the opening and closing parentheses in a character array are balanced, or a zero otherwise.

Balanced ← ≍"" ⍥(▽¬⊸(⦷"()") ▽⊸∊"()")∞

⍤⤙≍ 1 Balanced "((2×3)+4)"
⍤⤙≍ 1 Balanced ""
⍤⤙≍ 1 Balanced "hello world!"
⍤⤙≍ 0 Balanced ")(2×3)+4("
⍤⤙≍ 0 Balanced "(()"
⍤⤙≍ 0 Balanced ")"
