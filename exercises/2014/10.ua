# 2014-10: Sales Are Up
# Given a vector representing monthly sales figures, write a function that returns the greatest percent month to month increase.

GreatestPercentIncrease ← /↥⧈(×100÷⟜-)

⍤⤙≍ 25 GreatestPercentIncrease [80 100 120 140]
⍤⤙≍ 0 GreatestPercentIncrease [123 123 123]
⍤⤙≍ 11.76470588 ⁅₈ GreatestPercentIncrease [101 102 114 117 101 110 102 111 118 115 124 122]
⍤⤙≍ ¯10 GreatestPercentIncrease [200 180 160 140 120]
