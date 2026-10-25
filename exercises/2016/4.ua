# 2016-4: Just Meshing Around
# Write code that takes vectors as its left and right arguments and returns them “meshed” into a single vector formed by alternately taking successive elements from each argument. The arguments do not have to be the same length.

# Experimental!

# Solution
Solution ← ⊏⊙◌˜⍏°⊏⊃(⊂⊙⋅∘|⊂⋅⊙⋅∘)∩°⊏

# Tests
⍤⤙≍ "MEEKNESS" Solution "MENS" "EKES"
⍤⤙≍ "DAyPaLlog" Solution "Dyalog" "APL"
⍤⤙≍ "ADPyLalog" Solution "APL" "Dyalog"
⍤⤙≍ [1 2 3 4 5 6 7 8] Solution [1 3 5 7] [2 4 6 8] # should work with numeric vectors 
⍤⤙≍ "Hello" Solution "" "Hello"                    # either or both arguments could be empty
