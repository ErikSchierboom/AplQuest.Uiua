# 2023-1: Elimination Sort
# An “Elimination Sort” is a somewhat farcical sorting algorithm which starts with the leftmost element and keeps subsequent elements that are at least as large as the previous kept element, discarding all other elements. For example:
# 
# Write code that:
# 
# takes a non-empty numeric vector argument
# returns an "Elimination-sorted" vector of the argument

# Solution
Solution ← ▽⊸≥⊸\↥

# Tests
⍤⤙≍ [1 2 3 4 5 6 7 8 9 10] Solution +1⇡10

⍤⤙≍ [2 4 6 8 10] Solution [2 1 4 3 6 5 8 7 10 9]

⍤⤙≍ [1000 2500 3141 3141 4291.9 4292] Solution [1000 2500 1333 1969 3141 2345 3141 4291.9 4291.8 4292]

⍤⤙≍ [1 3 7 8 8 8 10] Solution [1 3 7 3 5 8 5 8 1 6 1 8 1 10 8 4 3 4 1 4]
