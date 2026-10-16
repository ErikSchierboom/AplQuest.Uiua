# 2013-10: Solution Salvation
# Many people have taken some sort of algebra class where you are presented with a set of linear equations like:
# 
# 3x + 2y = 13
# x - y = 1
# 
# The answer in this case is x=3 and y=2
# 
# Write a function which solves this type of problem. Hint: this is the easiest of all of the problems presented here.
# 
# The left argument is a vector of the values for the equations and the right argument is a matrix of the coefficients.

# Experimental!
Solve ← ⧋(/+×)⊙(⍉⇌⍜𝕍⟜(⍥¯°⊏÷/⨱|≡/⨱⧅<¯1))

⍤⤙≍ [3 2] Solve [13 1] ↯2_2[3 2 1 ¯1]
⍤⤙≍ [¯1 3 1] ⁅ Solve [2 6 4] ↯3_3[4 1 3 2 2 2 6 3 1]
