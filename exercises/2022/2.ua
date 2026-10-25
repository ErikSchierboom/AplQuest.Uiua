# 2022-2: Attack of the Mutations!
# This problem is inspired by the Counting Point Mutations problem found on the excellent Bioinformatics education website rosalind.info.
# 
# Write code that:
# - takes first and second arguments that are character vectors or scalars of equal length – these represent DNA strings.
# - returns an integer representing the Hamming distance (the number of differences in corresponding positions) between the arguments.

# Solution
Solution ← ⨬(0|/+≠)◡(=∩⧻)

# Tests
⍤⤙≍ 7 Solution "GAGCCTACTAACGGGAT" "CATCGTAATGACGGCCT"
⍤⤙≍ 1 Solution "A" "T"
⍤⤙≍ 0 Solution "" ""
⍤⤙≍ 0 Solution "" "CATCGTAATGACGGCCT"
