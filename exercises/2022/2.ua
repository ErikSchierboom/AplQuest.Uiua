# 2022-2: Attack of the Mutations!
# This problem is inspired by the Counting Point Mutations problem found on the excellent Bioinformatics education website rosalind.info.
# 
# Write a function that:
# - takes right and left arguments that are character vectors or scalars of equal length – these represent DNA strings.
# - returns an integer representing the Hamming distance (the number of differences in corresponding positions) between the arguments.

HammingDistance ← ⨬(0|/+≠)◡(=∩⧻)

⍤⤙≍ 7 HammingDistance "GAGCCTACTAACGGGAT" "CATCGTAATGACGGCCT"
⍤⤙≍ 1 HammingDistance "A" "T"
⍤⤙≍ 0 HammingDistance "" ""
⍤⤙≍ 0 HammingDistance "" "CATCGTAATGACGGCCT"
