# 2013-6: Home On The Range
# Write a function which returns the magnitude of the range (i.e. the difference between the lowest and highest values) of a numeric array.

Magnitude ← ⨬(0|∘|⌵-⊃⊢⊣⍆♭)⊸(↧2⧻)
⍤⤙≍ 25 Magnitude [19 ¯3 7.6 22]
⍤⤙≍ 101 Magnitude 101                    # should work with a scalar argument
⍤⤙≍ 50 Magnitude [[10 20 30] [40 50 60]] # should work with arrays of any number of dimensions
⍤⤙≍ 0 Magnitude []                       # including empty arrays
