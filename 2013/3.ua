# 2013-3: What Is In a Word
# Write a function which returns the number of words in the given character scalar or array.
# For simplicity's sake, you can consider the space character ' ' to be the only word separator.

WordCount ← ⧻⊜□⌵⊸±

⍤⤙≍ 4 WordCount "Testing one, two, three"
⍤⤙≍ 0 WordCount ""
⍤⤙≍ 5 WordCount " this array has extra blanks " # just counting the blanks won't work
