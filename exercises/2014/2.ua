# 2014-2: How Tweet It Is
# Twitter messages have a 140 character limit; what if the limit was even shorter? One way to shorten the message yet retain most readability is to remove interior vowels from its words. Write code which takes a character array and removes the interior vowels from each word.

# Solution
Solution ← ▽⊸(¬×⊃(∊"AEOUI"|⬚0⧈/× [¤3¤1¤1] ±)⌵)

# Tests
⍤⤙≍ "if yu cn rd ths, it wrkd!" Solution "if you can read this, it worked!"
⍤⤙≍ "APL is RLLY cl" Solution "APL is REALLY cool"
⍤⤙≍ "" Solution ""   # an empty array arg should return an empty array
⍤⤙≍ "a" Solution "a" # should work with a single character message
