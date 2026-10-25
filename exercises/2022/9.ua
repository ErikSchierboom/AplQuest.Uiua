# 2022-9: An Average Window (or a Windowed Average)
# Write code that:
#
# - takes a right argument Y that is a numeric scalar or non-empty vector.
# - takes a left argument X that represents the number of neighboring elements on either side of each element in Y.
# - returns a numeric vector or scalar where each element is the average (mean) of the corresponding element in Y and its X neighbors on either side. If an element has fewer than X neighbors on either side, replicate the first and last values as necessary to make X neighbors.

# Solution
Solution ← (
  ⊙⊃(+₁|+₁×₂)
  ⊸⍜(⊢|˜↯⊙[∘])
  ⍜(⊣|˜↯⊙[∘])
  ˜⧈(÷⊃(⧻|/+))
)

# Tests
⍤⤙≍ [1 2 3 4 5 6] Solution [1 2 3 4 5 6] 0                        # 0 neighbors on each side
⍤⤙≍ [1.333333333 2 3 4 5 5.666666667] ⁅₉ Solution [1 2 3 4 5 6] 1 # 1 neighbors on each side
⍤⤙≍ [1.6 2.2 3 4 4.8 5.4] Solution [1 2 3 4 5 6] 2                # 2 neighbors on each side
⍤⤙≍ [2.538461538 2.923076923 3.307692308 3.692307692 4.076923077 4.461538462] ⁅₉ Solution [1 2 3 4 5 6] 6
⍤⤙≍ [42] Solution [42] 10
