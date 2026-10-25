# 2015-10: Blaise'ing a Trail
# The Uiua expression to compute Pascal's triangle of order n is fairly simple
# 
# ⍚(≡⧅<⇡⊸+1)⇡11

# However, the output leaves something to be desired. Write code that takes an integer argument representing the order of the Pascal's triangle to be created and returns a "nicely" formatted character matrix. Because we're using a mono-spaced font and can only format whole character positions, lines do not have to be perfectly centered and may vary by a character position.

# Solution
Solution ← (
  ⍚(/$"_ _"≡⧅<⇡⊸+1)⇡+₁
  ⊸≡◇⧻
  ÷₂-⟜⊣
  ≡({∩(˜↯@ [∘])⊃⌊⌈})
  ≡($"___"⊃(∘|⋅⋅∘|⋅∘) °⊟)
)

# Tests
Expected ← ["                 1                 "
            "                1 1                "
            "               1 2 1               "
            "              1 3 3 1              "
            "             1 4 6 4 1             "
            "           1 5 10 10 5 1           "
            "         1 6 15 20 15 6 1          "
            "        1 7 21 35 35 21 7 1        "
            "      1 8 28 56 70 56 28 8 1       "
            "    1 9 36 84 126 126 84 36 9 1    "
            "1 10 45 120 210 252 210 120 45 10 1"]
⍤⤙≍ Expected Solution 10

Expected ← [" 1 "
            "1 1"]
⍤⤙≍ Expected Solution 1

Expected ← ["1"]
⍤⤙≍ Expected Solution 0
