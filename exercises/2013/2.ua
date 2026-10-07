# 2013-2: Making The Grade
# Write a function which returns the percent (from 0 to 100) of passing (65 or higher) grades in a array of grades.

PassingGradePercentage ← ↧100 ×100 ÷⊃(⧻|/+≥65)

⍤⤙≍ 60 PassingGradePercentage [25 90 100 64 65]
⍤⤙≍ 0 PassingGradePercentage [50]
⍤⤙≍ 100 PassingGradePercentage [80 90 100]
⍤⤙≍ 100 PassingGradePercentage [] # all grades in an empty array are passing
