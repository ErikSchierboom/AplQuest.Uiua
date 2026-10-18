# 2019-3: Grade Distribution
# The school's administrative department wants to publish some simple statistics. 
# Given a non-empty character vector of single-letter grades, produce a 3-column, 5-row, alphabetically-sorted matrix of each grade, the number of occurrences of that grade, and the percentage (rounded to 1 decimal position) of the total number of occurrences of that grade. 
# The table should have a row for each grade even if there are no occurrences of a grade.
# 
# Note: due to rounding the last column might not total 100%.

StatsTable ← (
  "ABCDF"
  ⟜(
    ≡/+⊞=
    ⟜(
      °⋕⁅₁×100÷⊸/+
      ⍜(⊏|⍚$"_  ")⊚≡≠⊸(⊸/↥/◇⊂⍚(/↥⦷@.))
      ⍚(⬚@ ˜↙)⟜(¯/↥/◇⊂⍚⧻)
    )
  )
  ≡$"_ _ _"
)

Expected ← ["A 3  9.7"
            "B 8 25.8"
            "C 7 22.6"
            "D 9 29  "
            "F 4 12.9"]
⍤⤙≍ Expected StatsTable ▽[9 3 8 4 7]"DABFC"

Expected ← ["A 7 35"
            "B 7 35"
            "C 6 30"
            "D 0  0"
            "F 0  0"]
⍤⤙≍ Expected StatsTable ↯[20]"ABC"

Expected ← ["A 0   0"
            "B 1 100"
            "C 0   0"
            "D 0   0"
            "F 0   0"]
⍤⤙≍ Expected StatsTable "B"
