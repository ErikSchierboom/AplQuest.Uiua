# 2019-9: Area Code à la Gauss
# Gauss's area formula, also known as the shoelace formula, is an algorithm to calculate the area of a simple polygon (a polygon that does not intersect itself). It's called the shoelace formula because of a common method using matrices to evaluate it. For example, the area of the triangle described by the vertices (2 4)(3 ¯8)(1 2) can be calculated by “walking around” the perimeter back to the first vertex, then drawing diagonals between the columns as shown below. The pattern created by the intersecting diagonals resembles shoelaces, hence the name “shoelace formula”
#
# First place the vertices in order above each other:	
# 2		4
# 3		¯8
# 1		2
# 2		4
#
# Sum the products of the numbers connected by the diagonal lines going down and to the right:
# (2×¯8)+(3×2)+(1×4)
# ¯6
#
# 2	│	4
# 3	│	¯8
# 1	│	2
# 2		4
# Next sum the products of the numbers connected by the diagonal lines going down and to the left:
# (4×3)+(¯8×1)+(2×2)
# 8
#
# 2	│	4
# 3	│	¯8
# 1	│	2
# 2		4
# Finally, halve the absolute value of the difference between the two sums:
# 0.5 × | ¯6 - 8
# 7
#
# 2	│	│	4
# 3	│	│	¯8
# 1	│	│	2
# 2			4
# Given a vector of (X Y) points, or a single X Y point, return a number indicating the area circumscribed by the points.

# Solution
Solution ← (
  ⊂⟜⊢
  ⊃(/+⧈₂(×⊓⊢⊣°⊟)|/+⧈₂(×⊓⊣⊢°⊟))
  ÷₂⌵-
)

# Tests
⍤⤙≍ 7 Solution [[2 4] [3 ¯8] [1 2]]

⍤⤙≍ 0 Solution [[1 1]] # a point has no area

⍤⤙≍ 0 Solution [[1 1] [2 2]] # neither does a line segment
