# 2018-10: Anagrammatically Correct
# An anagram is a word or phrase that can be formed by rearranging the letters of another. 
# For instance, "stained" and "instead" are anagrams, as are "emigrants" and "streaming".
#  Spaces are not considered significant in the comparison.
# 
# Write code that takes left and right arguments of character scalars or vectors returns a 1 if the arguments are anagrams of one another, 0 otherwise. You may assume that both arguments are both either upper-case or lower-case.

# Solution
Solution ← ≍∩(⍆▽⊸±⌵)

# Tests
⍤⤙≍ 1 Solution "ALBERT EINSTEIN" "TEN ELITE BRAINS"
⍤⤙≍ 1 Solution "" ""
⍤⤙≍ 1 Solution "d" "d"
⍤⤙≍ 0 Solution "mesas" "seam"
⍤⤙≍ 0 Solution "apple" "lapel"
