# 2013-9: It Is a Moving Experience
# Write code which produces n month moving averages for a year's worth of data.

# Solution
Solution ← ⧈(÷⊸⊃⧻/+)

# Tests
Sales ← [200 300 2700 3400 100 2000 400 2100 3500 3000 4700 4300]
⍤⤙≍ [250 1500 3050 1750 1050 1200 1250 2800 3250 3850 4500] Solution 2 Sales # produces 2 month moving averages

Sales ← [200 300 2700 3400 100 2000 400 2100 3500 3000 4700 4300]
⍤⤙≍ [1770 2220 2620] Solution 10 Sales # 10 month moving average

Sales ← [200 300 2700 3400 100 2000 400 2100 3500 3000 4700 4300]
⍤⤙≍ [200 300 2700 3400 100 2000 400 2100 3500 3000 4700 4300] Sales Solution 1 Sales # 1 month moving average is the same as sales
