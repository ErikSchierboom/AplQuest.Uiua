# 2018-3: Rolling Along
# Write a function that, given an integer scalar or vector representing the number of sides on each of a set of dice, will return a histogram showing the distribution curve for the possible totals that can be rolled using those dice.
# The histogram is a 2-column matrix where the left column contains the possible totals for the dice, and the right column has vectors containing asterisks representing the number of occurrences of the corresponding totals.

Histogram ← []

Expected ← [
  " 2  *      "
  " 3  **     "
  " 4  ***    "
  " 5  ****   "
  " 6  *****  "
  " 7  ****** "
  " 8  *****  "
  " 9  ****   "
  "10  ***    "
  "11  **     "
  "12  *      "
]
⍤⤙≍ Expected Histogram [6 6] # 2 6-sided dice

Expected ← [
  "1  *      "
  "2  *      "
  "3  *      "
  "4  *      "
  "5  *      "
  "6  *      "
]
⍤⤙≍ Expected Histogram [6] # 1 6-sided die (flat distribution)

Expected ← [
  " 3  *            "
  " 4  ***          "
  " 5  ******       "
  " 6  *********    "
  " 7  ***********  "
  " 8  ***********  "
  " 9  *********    "
  "10  ******       "
  "11  ***          "
  "12  *            "
]
⍤⤙≍ Expected Histogram [5 3 4] # 5, 3, and 4-sided dice

⍤⤙≍ [] Histogram [] # no dice
