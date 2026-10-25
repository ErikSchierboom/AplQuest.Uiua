# 2017-4: Slice(s) of Pie(s)
# Write code that calculates and returns the areas of 0 or more pie slices.
# The left argument is 0 or more angles (in degrees).
# The right argument is 0 or more pie diameters.

Solution ← ≡(×⊓(÷360|×πⁿ2))

⍤⤙≍ 12τ Solution 60 12
⍤⤙≍ 0 Solution 0 12                                                  # 0 degree slice
⍤⤙≍ 0 Solution 60 0                                                  # 0 diameter pie
⍤⤙≍ [27η 12τ 75η] Solution 60 [9 12 15]                              # 60 degree slices of 3 different pies
⍤⤙≍ [4241.15008234622 7539.822368615503 12τ] Solution 60 [90 120 12] # 3 different size slices of the same pie
⍤⤙≍ [27η 18τ 75π] Solution [60 90 120] [9 12 15]                     # different sizes of different pies
