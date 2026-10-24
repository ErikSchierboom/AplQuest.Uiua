# 2017-5: DNA?
# Write a function that takes a string representing a nucleotide and returns a 1 if it is a valid DNA string, 0 otherwise.
# In other words, are all the characters in the string in the set "ACGT"?

Solution ← /×∊"ATGC"

⍤⤙≍ 1 Solution "ATGCTTCAGAAAGGTCTTACG"
⍤⤙≍ 0 Solution "Dyalog"
⍤⤙≍ 1 Solution "" # an empty string is valid
⍤⤙≍ 1 Solution "T"
