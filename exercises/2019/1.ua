# 2019-1: Chunky Monkey
# Write code that, given a scalar or vector as the right argument and a positive (>0) integer chunk size n as the left argument, breaks the array"s items up into chunks of size n.
# If the number of elements in the array is not evenly divisible by n, then the last chunk will have fewer than n elements.

Solution ← ▽⊸≡(>0◇⧻) ⊂⊃(⧈□ [¤∘]|□↘⊸(-⊸◿⊙⧻))

⍤⤙≍ {[1 2 3] [4 5 6] [7 8 9]} Solution 3 +1⇡9
⍤⤙≍ {[1 2 3] [4 5 6] [7 8 9] [10 11]} Solution 3 +1⇡11
⍤⤙≍ {{"The" "cat"} {"in" "the"} {"hat" "sat"} {"pat"}} Solution 2 {"The" "cat" "in" "the" "hat" "sat" "pat"}
