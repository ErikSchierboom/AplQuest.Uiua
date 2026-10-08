# 2022-5: Stairway to Heaven
# (with apologies to Led Zeppelin)
# Write a function that:
# - takes a scalar integer argument, n, in the range 0-100.
# - returns a character matrix comprised of spaces and ⎕ that resembles an n-level left-to-right ascending stairway.

Stairway ← ≡($"__"⊓(↯⊙@ [∘]|↯⊙@⎕[∘]))⇌⟜+₁⇡

Expected ← ["         ⎕"
            "        ⎕⎕"
            "       ⎕⎕⎕"
            "      ⎕⎕⎕⎕"
            "     ⎕⎕⎕⎕⎕"
            "    ⎕⎕⎕⎕⎕⎕"
            "   ⎕⎕⎕⎕⎕⎕⎕"
            "  ⎕⎕⎕⎕⎕⎕⎕⎕"
            " ⎕⎕⎕⎕⎕⎕⎕⎕⎕"
            "⎕⎕⎕⎕⎕⎕⎕⎕⎕⎕"]
⍤⤙≍ Expected Stairway 10

⍤⤙≍ [] Stairway 0 # returns a 0×0 matrix
