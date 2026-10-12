# 2015-9: I'd Like Mine Scrambled Please
# There is an urban myth about some research that was supposedly done at Cambridge University that purports changing the order of the interior letters in the words of a sentence does not significantly hamper the readability of the sentence.

# Put another way...
# Teher is an ubran mtyh aobut smoe rseaecrh taht was spuopesldy dnoe at Cmarbdige Uinevsrtiy taht pruoptrs cahgnnig the odrer of the itnreoir lteetrs in the wrods of a sneetcne deos not sgiinifactnly hmaepr the raeadibilty of the sneetcne.

# In the above example, for words that contain more than 3 letters, the first and last letters remain the same while all of the interior letters are transposed in groups of two, ignoring punctuation. If there are an odd number of letters in the interior of the word, then the last letter is left as it is.

# Write a function that takes a character vector word as its argument and returns the word's letters juxtaposed as described above.

Scramble ← ⍚(⍜(⇌↘₁⇌↘₁|⊂⊃(/⊂⧈⇌[¤2]↙|↘)⊸(-⊸◿₂⧻)))

⍤⤙≍ {"tihs" "is" "aewosme"} Scramble {"this" "is" "awesome"}
