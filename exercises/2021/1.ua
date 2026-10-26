# 2021-1: Are You a Bacteria?
# A DNA string is composed of the letters 'A','C','G' and 'T'. The GC-content of a DNA string is given by the percentage of the symbols in the string that are either 'C' or 'G'. Very small discrepancies in GC-content can be used to distinguish species; for instance, most bacteria have a GC-content significantly higher than 50%.
# 
# Write code that:
# - has an argument that is a non-empty character vector representing a DNA string.
# -returns the percentage of GC-content in the string.

# Solution
Solution ← ×100÷⟜(⧻|/+∊"CG")

# Tests
⍤⤙≍ 100 Solution "GCGCGCGCCCGGGGCCG"

⍤⤙≍ 50 Solution "ACGTACGTACGTACGT"

⍤⤙≍ 58.33333333 ⁅₈ Solution ▽ [10 12 16 10] "ACGT"
