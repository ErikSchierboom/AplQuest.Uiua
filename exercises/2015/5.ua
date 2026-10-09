# 2015-5: He's so mean, he has no standard deviation
# The standard deviation of a population is calculated by taking the square root of the average of the squared differences of the values from their average value.
#
# Write a function that returns the population standard deviation of its numeric array right argument.

StandardDeviation ← √÷⊃(⋅⧻|/+ⁿ₂-) ⊸(÷⊃⧻/+)♭

⍤⤙≍ 1.414213562 ⁅₉ StandardDeviation [1 2 3 4 5]
⍤⤙≍ 28.86607005 ⁅₈ StandardDeviation ↯10_10 +1⇡100 # and higher dimensions as well
