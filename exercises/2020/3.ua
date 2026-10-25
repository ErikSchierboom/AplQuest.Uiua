# 2020-3: Excel-lent Columns
# A Microsoft Excel spreadsheet numbers its rows counting up from 1. However Excel's columns are labelled alphabetically — beginning with A–Z, then AA–AZ, BA–BZ, up to ZA–ZZ, then AAA–AAZ and so on.
# 
# Write code that, given an argument which is a character scalar or non-empty vector representing a valid character Excel column identifier between A and XFD, returns the corresponding column number.

# Solution
Solution ← /+×˜ⁿ26⇌⇡⊸⧻+1-@A

# Tests
⍤⤙≍ 1 Solution "A"
⍤⤙≍ 1104 Solution "APL"
