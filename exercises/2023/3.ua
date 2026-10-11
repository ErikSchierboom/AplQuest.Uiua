# 2023-3: Caesar Salad
# A Caesar cipher, also known as a shift cipher, is one of the simplest encryption techniques.
# In a Caesar cipher, each letter in the plaintext is replaced by a letter some fixed number of positions away in the alphabet, effectively "shifting" the alphabet.
#
# Write a function that:
#
# - takes a character vector right argument representing the plaintext message
# - takes a single integer left argument representing the size of the shift
# - returns a result with the same shape as the right argument representing the encrypted message
#
# The input will be uppercase letters and spaces.

CaesarCipher ← ⊏⊃(⊗⊙◌|˜↻) ⊂@ +@A⇡26

⍤⤙≍ "LIPPSD SVPHW" CaesarCipher 4 "HELLO WORLDS"
⍤⤙≍ "DAHHKWSKNH O" CaesarCipher ¯4 "HELLO WORLDS" # negative shifts are okay
⍤⤙≍ "HELLO WORLDS" CaesarCipher 0 "HELLO WORLDS"  # no shift is okay
⍤⤙≍ "HELLO WORLDS" CaesarCipher 27 "HELLO WORLDS"
⍤⤙≍ "" CaesarCipher ¯10 "" # returns an empty vector
