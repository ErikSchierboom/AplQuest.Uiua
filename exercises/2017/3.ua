# 2017-3: Miss Quoted
# Write a function that will remove text found between pairs of double quotes (").

Unquote ← ▽⊸(↥⊸(¬\≠)=@")

⍤⤙≍ "this \"\" a test" Unquote "this \"is\" a test"
⍤⤙≍ "this is a test" Unquote "this is a test"
⍤⤙≍ "this \"\" a \"\"" Unquote "this \"is\" a \"test\""
⍤⤙≍ "" Unquote ""
