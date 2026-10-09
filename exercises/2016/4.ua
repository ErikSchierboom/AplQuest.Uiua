# 2016-4: Just Meshing Around
# Write a function that takes vectors as its left and right arguments and returns them “meshed” into a single vector formed by alternately taking successive elements from each argument. The arguments do not have to be the same length.

Mesh ← ♭≡⊂

⍤⤙≍ "MEEKNESS" Mesh "MENS" "EKES"
⍤⤙≍ "DAyPaLlog" Mesh "Dyalog" "APL"
⍤⤙≍ "ADPyLalog" Mesh "APL" "Dyalog"
⍤⤙≍ [1 2 3 4 5 6 7 8] Mesh [1 3 5 7] [2 4 6 8] # should work with numeric vectors 
⍤⤙≍ "Hello" Mesh "" "Hello"                    # either or both arguments could be empty
