# 2017-7: Counting DNA Nucleotides
# Write code that takes a character vector representing a DNA string and returns 4 integers of the number of occurrences for each of the symbols 'A', 'C', 'G', and 'T' respectively.

Solution ← map ⟜(⬚0↯[4] ⊕⧻ ⊸⊗) "ACGT"

⍤⤙≍ map "ACGT" [14 8 10 17] Solution "AGCTTTTCATTCTGACTGCTGTCTTTAAAAAAAGAGTGTCTGATAGCAG"
⍤⤙≍ map "ACGT" [3 2 4 1] Solution "CCAAATGGGG"
⍤⤙≍ map "ACGT" [0 0 0 0] Solution ""
⍤⤙≍ map "ACGT" [0 0 1 0] Solution "G"
