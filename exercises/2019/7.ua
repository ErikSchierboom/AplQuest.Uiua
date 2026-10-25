# 2019-7: In the Center of It All
# Given a right argument of a list of words (or possibly a single word) and a left argument of a width, return a character matrix that has width columns and one row per word, where each word is centered within the row. If width is smaller than the length of a word, truncate the word from the right. If there are an odd number of spaces to center within, leave the extra space on the right.

# Solution
Solution ← (
  ˜⍚(↙⊃(↧⧻|∘))
  ⊸≡◇⧻
  ⟜/↥
  ÷₂-
  ⍚(⊃(˜↯@ [∘]⌊|˜↯@ [∘]⌈))
  ≡◇($"___"⊃(∘|⋅⋅∘|⋅∘))
)

# Tests
Expected ← ["   APL    "
            " Problem  "
            " Solving  "
            "Competitio"]
⍤⤙≍ Expected Solution 10 {"APL" "Problem" "Solving" "Competition"}
