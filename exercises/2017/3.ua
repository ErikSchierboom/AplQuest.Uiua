# 2017-3: Miss Quoted
# Write code that will remove text found between pairs of double quotes (").

# Solution
Solution ← ▽⊸(↥⊸(¬\≠)=@")

# Tests
⍤⤙≍ "this \"\" a test" Solution "this \"is\" a test"

⍤⤙≍ "this is a test" Solution "this is a test"

⍤⤙≍ "this \"\" a \"\"" Solution "this \"is\" a \"test\""

⍤⤙≍ "" Solution ""
