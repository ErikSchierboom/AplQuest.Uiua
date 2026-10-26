# 2016-6: Shorter Ones to the Front
# Write code that takes a vector of vectors as its argument and returns it sorted by the length of each element.
# An element of the vector can be scalar or an empty vector.

# Solution
Solution ← ⊏⍏⊸⍚⧻

# Tests
⍤⤙≍ {"one" "two" "six" "four" "five" "three"} Solution {"one" "two" "three" "four" "five" "six"}

⍤⤙≍ {1 [4 5] [7 3] [2 4 3]} Solution {[2 4 3] [4 5] 1 [7 3]}

⍤⤙≍ [] Solution [] # should return an empty vector

⍤⤙≍ {"" 2 "one" "four" [5 6 7 8] "three"} Solution {"one" 2 "three" "" "four" [5 6 7 8]}
