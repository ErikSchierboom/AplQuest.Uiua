# 2014-2: How Tweet It Is
# Twitter messages have a 140 character limit; what if the limit was even shorter? One way to shorten the message yet retain most readability is to remove interior vowels from its words. Write a function which takes a character array and removes the interior vowels from each word.

Shorten ← ▽⊸(¬×⊃(∊"AEOUI"|⬚0⧈/× [¤3¤1¤1] ±)⌵)

⍤⤙≍ "if yu cn rd ths, it wrkd!" Shorten "if you can read this, it worked!"
⍤⤙≍ "APL is RLLY cl" Shorten "APL is REALLY cool"
⍤⤙≍ "" Shorten ""   # an empty array arg should return an empty array
⍤⤙≍ "a" Shorten "a" # should work with a single character message
