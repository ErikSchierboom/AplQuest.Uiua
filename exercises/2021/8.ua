# 2021-8: Time to Make a Difference
# Write code that:
#
# has a right argument that is a numeric scalar or vector of length up to 3, representing a number of [[[days] hours] minutes] – a single number represents minutes, a 2-element vector represents hours and minutes, and a 3-element vector represents days, hours, and minutes.
# has a similar left argument, although not necessarily the same length as the right argument.
# returns a single number representing the magnitude of the difference in minutes between the arguments.

# Solution
Solution ← ⌵-∩(/+⬚0×1_60_1440↯[∞]⇌)

# Tests
⍤⤙≍ 165 Solution [2 30] [5 15]
⍤⤙≍ 165 Solution [5 15] [2 30]
⍤⤙≍ 1440 Solution [1 0 0] 0  # number of minutes in a day
⍤⤙≍ 1440 Solution [1 0 0] [] # don't forget to handle empty arguments!
⍤⤙≍ 120 Solution [1 0] [¯1 0]
⍤⤙≍ 0 Solution [1.5 0] 90
