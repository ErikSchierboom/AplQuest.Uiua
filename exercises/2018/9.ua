# 2018-9: Earlier, Later, or the Same?
# The system function datetime returns a 6-element integer vector timestamp representing the current year, month, day, hour, minute, and second in that order.

# Write code that given left and right arguments of such timestamps returns a ¯1, 1, or 0 if the left argument represents a time that is respectively, earlier than, later than, or simultaneous with the right argument.

# Solution
Solution ← ⬚0⊢▽⊸⌵±-

# Tests
⍤⤙≍ 1 Solution [2018 4 1 12 34 56] [2018 4 1 16 45 12]
⍤⤙≍ 0 Solution [2018 4 1 12 34 56] [2018 4 1 12 34 56]
⍤⤙≍ ¯1 Solution [2018 4 1 12 34 56] [2017 4 1 12 34 56]
