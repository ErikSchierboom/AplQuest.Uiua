# 2013-4: Keeping Things In Balance
# Write code which returns a 1 if the opening and closing parentheses in a character array are balanced, or a 0 otherwise.

Solution ← ≍"" ⍥(▽¬⊸(⦷"()") ▽⊸∊"()")∞

⍤⤙≍ 1 Solution "((2×3)+4)"
⍤⤙≍ 1 Solution ""
⍤⤙≍ 1 Solution "hello world!"
⍤⤙≍ 0 Solution ")(2×3)+4("
⍤⤙≍ 0 Solution "(()"
⍤⤙≍ 0 Solution ")"
