# 2022-1: Counting DNA Nucleotides?
# This problem was inspired by Counting DNA Nucleotides found on the excellent bioinformatics website rosalind.info.
# Write a function that:
# - takes a right argument that is a character vector or scalar representing a DNA string (whose alphabet contains the symbols "A", "C", "G", and "T").
# - returns a 4-element numeric vector containing the counts of each symbol "A", "C", "G", and "T" respectively.

NucleotideCount ← map ⟜(⬚0↯[4] ⊕⧻ ⊸⊗) "ACGT"

⍤⤙≍ map "ACGT" [20 12 17 21] NucleotideCount "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
⍤⤙≍ map "ACGT" [0 0 0 0] NucleotideCount ""
⍤⤙≍ map "ACGT" [0 0 1 0] NucleotideCount "G"
