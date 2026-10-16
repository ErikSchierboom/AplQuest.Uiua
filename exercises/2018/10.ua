# 2018-10: Anagrammatically Correct
# An anagram is a word or phrase that can be formed by rearranging the letters of another. 
# For instance, "stained" and "instead" are anagrams, as are "emigrants" and "streaming".
#  Spaces are not considered significant in the comparison.
# 
# Write a function that takes left and right arguments of character scalars or vectors returns a 1 if the arguments are anagrams of one another, 0 otherwise. You may assume that both arguments are both either upper-case or lower-case.

AreAnagrams ← ≍∩(⍆▽⊸±⌵)

⍤⤙≍ 1 AreAnagrams "ALBERT EINSTEIN" "TEN ELITE BRAINS"
⍤⤙≍ 1 AreAnagrams "" ""
⍤⤙≍ 1 AreAnagrams "d" "d"
⍤⤙≍ 0 AreAnagrams "mesas" "seam"
⍤⤙≍ 0 AreAnagrams "apple" "lapel"
