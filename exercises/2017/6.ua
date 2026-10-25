# 2017-6: k-mers
# The term k-mer typically refers to all the possible substrings of length k that are contained in a string. In computational genomics, k-mers refer to all the possible subsequences (of length k) from a read obtained through DNA Sequencing. Write code that takes a character vector as its right argument and k (the substring length) as its left argument and returns a vector of the k-mers of the original string.

# Solution
Solution ← ⧈∘

# Tests
⍤⤙≍ ["ATCG" "TCGA" "CGAA" "GAAG" "AAGG" "AGGT" "GGTC" "GTCG" "TCGT"] Solution 4 "ATCGAAGGTCGT"
⍤⤙≍ 0_4△ Solution 4 "AC" #  k>string length? Return an empty vector
