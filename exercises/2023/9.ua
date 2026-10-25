# 2023-9: Flipping Pairs
# This problem has no practical use in the real world (that the author can think of) other than to give your array manipulation muscles some exercise.
# 
# Write code that:
# 
# takes a non-empty non-scalar array argument
# returns an array of the same shape as the argument, but with pairs of elements along the last axis "flipped". If the array has an odd number of elements in the last axis, leave the last element unchanged.

# Solution
Solution ← (
  ↯⊃([∞⊣△]|♭|△)
  ≡(/◇⊂⊜(□⇌)⊸(\+˜↯1_0[⧻]))
  ˜↯
)

# Tests
Expected ← [2 1 4 3 6 5 8 7 10 9]
⍤⤙≍ Expected Solution +1⇡10

Expected ← [2 1 4 3 6 5 8 7 9]
⍤⤙≍ Expected Solution +1⇡9

Expected ← [
  [2 1]
  [4 3]
  [6 5]
  [8 7]
]
⍤⤙≍ Expected Solution ↯4_2+1⇡8

Expected ← [
  [2 1 3]
  [5 4 6]
  [8 7 9]
  [11 10 12]
]
⍤⤙≍ Expected Solution ↯4_3+1⇡12

Expected ← [
  [ [2 1 3]
    [5 4 6]
    [8 7 9]]

  [ [11 10 12]
    [14 13 15]
    [17 16 18]]

  [ [20 19 21]
    [23 22 24]
    [26 25 27]]
]
⍤⤙≍ ? Expected Solution ↯3_3_3+1⇡27

Expected ← [
  {"duck" "donald" "wrote"}
  {"good" "some" "APL"}
]
⍤⤙≍ Expected Solution ↯2_3{"donald" "duck" "wrote" "some" "good" "APL"}
