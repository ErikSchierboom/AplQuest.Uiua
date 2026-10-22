# 2020-10: Stacking It Up
# Write a function that takes as its right argument a vector of simple arrays of rank 2 or less (scalar, vector, or matrix). 
# Each simple array will consist of either non-negative integers or printable ASCII characters.
# The function must return a simple character array that displays identically to what {⎕←⍵}¨ displays when applied to the right argument.

StackUp ← ⍚(°¤pretty)

Expected ← {
  "\"Hi\""
  "\"Earth\""
}
⍤⤙≍ Expected StackUp {"Hi" "Earth"}

Expected ← {
  "1"
  "2"
  "3"
  "4"
}
⍤⤙≍ Expected StackUp +1⇡4

Expected ← {
  "@A"
}
⍤⤙≍ Expected StackUp "A"
