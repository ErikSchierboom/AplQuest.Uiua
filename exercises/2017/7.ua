# 2017-7: Counting DNA Nucleotides
# Write a function that takes a character vector representing a DNA string and returns 4 integers of the number of occurrences for each of the symbols 'A', 'C', 'G', and 'T' respectively.

NucleotideCount ← map ⟜(⬚0↯[4] ⊕⧻ ⊸⊗) "ACGT"

⍤⤙≍ map "ACGT" [14 8 10 17] NucleotideCount "AGCTTTTCATTCTGACTGCTGTCTTTAAAAAAAGAGTGTCTGATAGCAG"
⍤⤙≍ map "ACGT" [3 2 4 1] NucleotideCount "CCAAATGGGG"
⍤⤙≍ map "ACGT" [0 0 0 0] NucleotideCount ""
⍤⤙≍ map "ACGT" [0 0 1 0] NucleotideCount "G"
