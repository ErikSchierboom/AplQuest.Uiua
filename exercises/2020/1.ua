# 2020-1: Let"s Split!
# Write code that, given a right argument Y which is a scalar or a non-empty vector and a left argument X which is a single non-zero integer so that its absolute value is less or equal to ≢Y, splits Y into a vector of two vectors according to X, as follows: - If X>0, the first vector contains the first X elements of Y and the second vector contains the remaining elements. - If X<0, the second vector contains the last |X elements of Y and the first vector contains the remaining elements.

# Solution
Solution ← {⊃↙↘} ⨬(⋅∘|∘)⊸±⊸˜◿⊙⊸⧻

# Tests
⍤⤙≍ {"Splitting" "Hairs"} Solution 9 "SplittingHairs"
⍤⤙≍ {"Dyalog" "APL"} Solution ¯3 "DyalogAPL"
⍤⤙≍ {[1 2 3 4 5 6 7 8 9 10] []} Solution 10 +1⇡10
⍤⤙≍ {{"works"} {"with" "words" "also"}} Solution 1 {"works" "with" "words" "also"}
