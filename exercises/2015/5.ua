# 2015-5: He's so mean, he has no standard deviation
# The standard deviation of a population is calculated by taking the square root of the average of the squared differences of the values from their average value.
#
# Write code that returns the population standard deviation of its numeric array argument.

# Solution
Solution ← √÷⊃(⋅⧻|/+ⁿ₂-) ⊸(÷⊃⧻/+)♭

# Tests
⍤⤙≍ 1.414213562 ⁅₉ Solution [1 2 3 4 5]
⍤⤙≍ 28.86607005 ⁅₈ Solution ↯10_10 +1⇡100 # and higher dimensions as well
