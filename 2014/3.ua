# 2014-3: Tell a Fib
# Write a function that takes an integer right argument and returns that number of terms in the Fibonacci sequence.

Fib ← ⍥◡+⊙(1 1)

⍤⤙≍ [1 1 2 3 5 8 13 21 34 55] Fib 10
⍤⤙≍ [1] Fib 1
⍤⤙≍ [] Fib 0
