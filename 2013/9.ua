# 2013-9: It Is a Moving Experience
# Write a function which produces n month moving averages for a year's worth of data.

MovingAverage ← ⧈(÷⊸⊃⧻/+)

Sales ← [200 300 2700 3400 100 2000 400 2100 3500 3000 4700 4300]
⍤⤙≍ [250 1500 3050 1750 1050 1200 1250 2800 3250 3850 4500] MovingAverage 2 Sales
⍤⤙≍ [1770 2220 2620] MovingAverage 10 Sales
⍤⤙≍ [200 300 2700 3400 100 2000 400 2100 3500 3000 4700 4300] Sales MovingAverage 1 Sales
