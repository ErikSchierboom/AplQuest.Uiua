# 2015-4: PDI - Progressive Dyadic Iota
# The indexin function returns a simple integer vector that identifies where the major cells of Y are first found in X.
# If a major cell of Y cannot be found in X, then the corresponding item of the returned array will be 1+≢X.
#
# Progressive dyadic iota is similar to indexin except that it returns the index of subsequent matches in the first argument until they are exhausted.
# Write code that implements progressive dyadic iota.

# Solution
Solution ← ⊗∩(⍉⊟∩⍚∘⊸⧆)

# Tests
⍤⤙≍ [2 7 10 3 9 10 10] Solution "DYALOG APL" "AAALLLB"
⍤⤙≍ [0 0 0 0] Solution "" "test" # should work with empty first argument 
⍤⤙≍ [] Solution "test" ""        # should work with empty second argument
