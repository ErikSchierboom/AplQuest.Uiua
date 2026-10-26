# 2017-4: Slice(s) of Pie(s)
# Write code that calculates and returns the areas of 0 or more pie slices.
# The first argument is 0 or more angles (in degrees).
# The second argument is 0 or more pie diameters.

# Solution
Solution ← ≡(×⊓(÷360|×πⁿ2÷2))

# Tests
⍤⤙≍ 3τ Solution 60 12

⍤⤙≍ 0 Solution 0 12 # 0 degree slice

⍤⤙≍ 0 Solution 60 0 # 0 diameter pie

⍤⤙≍ [10.602875205865551 3τ 29.45243112740431] Solution 60 [9 12 15] # 60 degree slices of 3 different pies

⍤⤙≍ [1060.287520586555 1884.9555921538758 3τ] Solution 60 [90 120 12] # 3 different size slices of the same pie

⍤⤙≍ [10.602875205865551 9π 75τ/8] Solution [60 90 120] [9 12 15] # different sizes of different pies
