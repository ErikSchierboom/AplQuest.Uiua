# 2016-6: Shorter Ones to the Front
# Write a function that takes a vector of vectors as its right argument and returns it sorted by the length of each element.
# An element of the vector can be scalar or an empty vector.

ShorterOnesToFront ← ⊏⍏⊸⍚⧻

⍤⤙≍ {"one" "two" "six" "four" "five" "three"} ShorterOnesToFront {"one" "two" "three" "four" "five" "six"}
⍤⤙≍ {1 [4 5] [7 3] [2 4 3]} ShorterOnesToFront {[2 4 3] [4 5] 1 [7 3]}
⍤⤙≍ [] ShorterOnesToFront [] # should return an empty vector
⍤⤙≍ {"" 2 "one" "four" [5 6 7 8] "three"} ShorterOnesToFront {"one" 2 "three" "" "four" [5 6 7 8]}
