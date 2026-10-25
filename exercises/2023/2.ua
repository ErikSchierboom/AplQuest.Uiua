# 2023-2: Put It In Reverse
# In this problem, you"re asked to return a result that identifies the endings of occurrences of array X in array Y. To keep things simple, X and Y will be at most rank 1, meaning they"ll either be vectors or scalars.
# 
# Write code that:
# - takes a scalar or vector left argument
# - takes a scalar or vector right argument
# - returns a Boolean result that is the same shape as the right argument where 1"s mark the ends of occurrences of the left argument in the right argument

# Solution
Solution ← ⍜∩⇌⌕

# Tests
⍤⤙≍ [0 0 0 1 0 0 0 0 0 0 1] Solution "abra" "abracadabra"
⍤⤙≍ [0 0 0 0 1 0 0 1 0 0 0] Solution "issi" "Mississippi"
⍤⤙≍ [0 1 1 0 0 1 1] Solution "bb" "bbb bbb"
⍤⤙≍ 0 Solution [42 42] 42
⍤⤙≍ 1 Solution 42 42
⍤⤙≍ [0 0 1 0] Solution {"are" "aquatic"} {"ducks" "are" "aquatic" "avians"}
