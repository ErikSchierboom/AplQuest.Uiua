# 2020-3: Excel-lent Columns
# A Microsoft Excel spreadsheet numbers its rows counting up from 1. However Excel's columns are labelled alphabetically — beginning with A–Z, then AA–AZ, BA–BZ, up to ZA–ZZ, then AAA–AAZ and so on.
# 
# Write a function that, given a right argument which is a character scalar or non-empty vector representing a valid character Excel column identifier between A and XFD, returns the corresponding column number.

Column ← /+×˜ⁿ26⇌⇡⊸⧻+1-@A

⍤⤙≍ 1 Column "A"
⍤⤙≍ 1104 Column "APL"
