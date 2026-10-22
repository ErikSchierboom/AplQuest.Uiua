# 2021-4: Square Peg, Round Hole
# Write a function that:
# - takes a right argument which is an array of positive numbers representing circle diameters
# - returns a numeric array of the same shape as the right argument representing the difference between the areas of the circles and the areas of the largest squares that can be inscribed within each circle

SquarePegRoundHole ← ×÷₄-₂πⁿ₂

Expected ← [1.14159265 4.56637061 10.27433388 18.26548246 28.53981634]
⍤⤙≍ Expected ⁅₈ SquarePegRoundHole ×2+1⇡5

Expected ← ↯3_3 [
  0.57079633 2.28318531 5.13716694
  9.13274123 14.26990817 20.54866776
  27.96902001 36.53096491 46.23450247
]
⍤⤙≍ Expected ⁅₈ SquarePegRoundHole ×√2 ↯3_3+1⇡9
