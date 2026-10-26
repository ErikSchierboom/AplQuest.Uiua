# 2019-2: Making the Grade
# Write code that, given an array of integer test scores in the inclusive range 0–100, returns an identically-shaped array of the corresponding letter grades according to the below table.
#
# | Score Range | Letter Grade |
# | ----------- | ------------ |
# | 0–64        | F            |
# | 65–69       | D            |
# | 70–79       | C            |
# | 80–89       | B            |
# | 90–100      | A            |

# Solution
Solution ← ˜⊏ ▽ 65_5_10_10_11 "FDCBA"

# Tests
⍤⤙≍ "FFDDCCBBAA" Solution [0 64 65 69 70 79 80 89 90 100]

⍤⤙≍ "" Solution [] # returns an empty vector

Expected ← ["CBB"
            "BBF"]
⍤⤙≍ Expected Solution ↯2_3 [71 82 81 82 84 59]
