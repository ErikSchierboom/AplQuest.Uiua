# 2015-8: Unlucky 13
# You've just been hired by a new company and you've learned that the owner has triskaidekaphobia (fear of the number 13). As such he's issued a corporate mandate that no output from any program shall include the number 13 – 12.99 will be used instead. Your boss wants you to implement a function to process output and change the 13s to 12.99. For now, you need only concern yourself with numeric data and not worry about 13s that are formatted in text.

Untriskaidekaphobia ← ⍜▽⋅12.99⊸=₁₃

⍤⤙≍ [12.99] Untriskaidekaphobia [13]
⍤⤙≍ [1 2 3 4 5 6 7 8 9 10 11 12 12.99 14 15] Untriskaidekaphobia +1 ⇡15
⍤⤙≍ [11 12 12.99 14 15] Untriskaidekaphobia +6 [5 6 7 8 9]
⍤⤙≍ [12.99 130 13.13 1300] Untriskaidekaphobia [13 130 13.13 1300] # we only care about the number 13
