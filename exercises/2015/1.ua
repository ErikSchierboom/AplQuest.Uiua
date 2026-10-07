# 2015-1: Nag A Ram
# Write a function that takes two character vectors as its left and right arguments and returns 1 if they are anagrams of each other. An anagram of a string uses all of the letters of the string ignoring word spacing, capitalisation, and punctuation.

IsAnagram ← ≍∩(⍆▽⊸±⌵)

⍤⤙≍ 1 IsAnagram "anagram" "Nag A Ram"
⍤⤙≍ 1 IsAnagram "Dyalog APL" "Dog Pay All"
⍤⤙≍ 1 IsAnagram "" "  !#!"
⍤⤙≍ 0 IsAnagram "abcde" "zyxwvu"
