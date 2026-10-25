# 2022-5: Stairway to Heaven
# (with apologies to Led Zeppelin)
# Write code that:
# - takes a scalar integer argument, n, in the range 0-100.
# - returns a character matrix comprised of spaces and ⎕ that resembles an n-level left-to-right ascending stairway.

Solution ← ≡($"__"⊓(↯⊙@ [∘]|↯⊙@⎕[∘]))⇌⟜+₁⇡

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
⍤⤙≍ Expected Solution 10

⍤⤙≍ [] Solution 0 # returns a 0×0 matrix
