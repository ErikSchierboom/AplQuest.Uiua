# 2020-4: Take a Leap
# Write a function that, given a right argument which is an integer array of year numbers greater than or equal to 1752 and less than 4000, returns a result of the same shape as the right argument where 1 indicates that the corresponding year is a leap year (0 otherwise).
#
# A leap year algorithm can be found [here](https://en.wikipedia.org/wiki/Leap_year#Algorithm).

IsLeap ← ≡₀(/≠ =₀ ◿4_100_400)

⍤⤙≍ 1 IsLeap 2020
⍤⤙≍ [] IsLeap [] # returns an empty vector

Expected ← [[0 0 0 1 0 0 0 1 0 0]
            [0 1 0 0 0 1 0 0 0 1]
            [0 0 0 1 0 0 0 1 0 0]
            [0 1 0 0 0 1 0 0 0 1]
            [0 0 0 1 0 0 0 1 0 0]
            [0 1 0 0 0 1 0 0 0 1]
            [0 0 0 1 0 0 0 1 0 0]
            [0 1 0 0 0 1 0 0 0 1]
            [0 0 0 1 0 0 0 1 0 0]
            [0 1 0 0 0 1 0 0 0 1]]
⍤⤙≍ Expected IsLeap +1900 ↯ 10_10 +1 ⇡100
