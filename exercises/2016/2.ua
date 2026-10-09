# 2016-2: Statistics - Median
# Write a function that takes a numeric vector as its right argument and returns the median of the array. The median is the number separating the higher half of the vector from the lower half. The median can be found by arranging all the observations from lowest value to highest value and picking the middle one. If there is an even number of observations, then there is no single middle value; the median is then defined to be the mean of the two middle values.

Median ← ÷₂⬚0/+⬚0⊏[⊃⌊⌈]÷₂⊸(↥₀-₁⧻)⍆

⍤⤙≍ 5 Median [1 2 3 4 5 6 7 8 9]
⍤⤙≍ 4.5 Median [1 8 2 7 3 6 4 5]
⍤⤙≍ 0 Median []
⍤⤙≍ 7 Median [7 7]
