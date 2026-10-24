# 2020-2: Character Building
# UTF-8 encodes Unicode characters using 1-4 integers for each character.
# Uiua includes a system function, utf₈, that can convert characters into integers and integers into characters.
# The expression utf₈ "UTF-8" converts between characters and UTF-8 and °utf₈ does the reverse.
#
# Consider the following:

#       utf₈ "D¥⍺⌊○9"
# [68 194 165 226 141 186 226 140 138 226 151 139 57]
#       °utf₈ [68 194 165 226 141 186 226 140 138 226 151 139 57]
# "D¥⍺⌊○9"
# How many integers does each character use?
#
# ≡(□utf₈) graphemes "D¥⍺⌊○9"
# {[68] [194 165] [226 141 186] [226 140 138] [226 151 139] [57]}
# The rule is that an integer in the range 128 to 191 (inclusive) continues the character of the previous integer (which may itself be a continuation).
#  With that in mind, write a function that, given a right argument which is a simple integer vector representing valid UTF-8 text, encloses each sequence of integers that represent a single character, like the result of 'UTF-8'∘⎕UCS¨'UTF-8'∘⎕UCS but does not use any system functions (names beginning with ⎕).

Solution ← ⊜□\+¬∩⇌⊸(↧⊃≥₁₂₈≤₁₉₁)⇌

⍤⤙≍ {[68] [194 165] [226 141 186] [226 140 138] [240 159 148 178] [57]} Solution [68 194 165 226 141 186 226 140 138 240 159 148 178 57] # D¥⍺⌊🔲9
⍤⤙≍ {[68] [121] [97] [108] [111] [103]} Solution [68 121 97 108 111 103]                                                                 # 'Dyalog'
⍤⤙≍ {} Solution []                                                                                                                       # ''
