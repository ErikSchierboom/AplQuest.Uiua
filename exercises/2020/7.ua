# 2020-7: See You in a Bit
# A common technique for encoding a set of on/off states is to use a value of 2n for the state in position n (origin 0), 1 if the state is "on" or 0 for "off" and then add the values.
# Dyalog APL's component file permission codes are an example of this.
# For example, if you wanted to grant permissions for read (access code 1), append (access code 8) and rename (access code 128) then the resulting code would be 137 because that's 1 + 8 + 128.
#
# Write a function that, given a non-negative right argument which is an integer scalar representing the encoded state and a left argument which is an integer scalar representing the encoded state settings that you want to query, returns 1 if all of the codes in the left argument are found in the right argument (0 otherwise).

Encoded ← /×⬚0▽∩⋯₈

⍤⤙≍ 1 Encoded 2 7  # is 2 in 7 (1+2+4)?
⍤⤙≍ 0 Encoded 4 11 # is 4 in 11 (1+2+8)?
⍤⤙≍ 1 Encoded 3 11 # is 3 (1+2) in 11 (1+2+8)?
⍤⤙≍ 0 Encoded 4 0  # is 4 in 0?
