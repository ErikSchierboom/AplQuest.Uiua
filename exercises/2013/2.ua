# 2013-2: Making The Grade
# Write code which returns the percent (from 0 to 100) of passing (65 or higher) grades in a array of grades.

Solution ← ↧100 ×100 ÷⊃(⧻|/+≥65)

⍤⤙≍ 60 Solution [25 90 100 64 65]
⍤⤙≍ 0 Solution [50]
⍤⤙≍ 100 Solution [80 90 100]
⍤⤙≍ 100 Solution [] # all grades in an empty array are passing
