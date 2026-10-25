# 2019-5: Doubling Up
# Given a word or a list of words, return a Boolean vector where 1 indicates a word with one or more consecutive duplicated, case-sensitive, letters. Each word will have at least one letter and will consist entirely of either uppercase (A–Z) or lowercase (a–z) letters. 
# Words consisting of a single letter can be scalars.

# Solution
Solution ← ≡◇(±/↥⧆)

# Tests
⍤⤙≍ [0 1 0 1] Solution {"I" "feed" "the" "bookkeeper"}
⍤⤙≍ [0] Solution {"I"}
⍤⤙≍ [1] Solution {"feed"}
⍤⤙≍ [0 1 0 1 1] Solution {"MY" "LLAMAS" "HAVE" "BEEN" "GOOD"}
