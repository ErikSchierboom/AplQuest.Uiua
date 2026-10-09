# 2015-7: Just in (Upper) Case
# Membership X∊Y returns a boolean array of shape ⍴X with 1s indicating where elements of Y occur in X. For a vector X this results in a very convenient boolean mask.
# 
# In many instances, it is desirable to perform case-insensitive comparisons and operations. Write a function to perform case-insensitive membership between two arrays.

CaseInsensitiveEqual ← ˜∊∩⌵

⍤⤙≍ [0 0 1 1 0 0] CaseInsensitiveEqual "dyalog" "APL"
⍤⤙≍ [0 1 1 1 0 1 0] CaseInsensitiveEqual "bramley" "HAMPSHIRE"
