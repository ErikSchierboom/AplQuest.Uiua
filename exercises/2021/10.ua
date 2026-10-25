# 2021-10: On the Right Side
# Write code that:
# 
# has a right argument T that is a character scalar, vector or a vector of character vectors/scalars.
# has a left argument W that is a positive integer specifying the width of the result.
# returns a right-aligned character array R of shape ((2=|≡T)/≢T),W meaning R is one of the following:
# a W-wide vector if T is a simple vector or scalar.
# a W-wide matrix with the same number rows as elements of T if T is a vector of vectors/scalars.
# if an element of T has length greater than W, truncate it after W characters.

# Experimental!
Solution ← ˜◇≡(⍜(⇌|˜⬚@ ↙)°□)

Expected ← ["     ⍒"]
⍤⤙≍ ? Expected Solution 6 {"⍒"}

Expected ← ["       K"
            "       E"
            " Iverson"]
⍤⤙≍ Expected Solution 8 {"K" "E" "Iverson"}

Expected ← ["    Parade"]
⍤⤙≍ Expected Solution 10 {"Parade"}

Expected ← ["r Phrase"
            "     APL"
            "  Parade"]
⍤⤙≍ Expected Solution 8 {"Longer Phrase" "APL" "Parade"}
