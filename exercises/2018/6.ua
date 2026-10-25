# 2018-6: What's Your Angle?
# XML elements are denoted with content enclosed in beginning and ending tags. The tags themselves are enclosed in left and right angle brackets < and >. The only valid occurrences of angle brackets are as a part of beginning or ending tags.
#
# For example, the following is valid
#
# <name><first>Drake</first><last>Mallard</last></name>
# Whereas the following is not valid XML
#
# <math><relation>2<3</relation></math>
# One easy validation is to check that the angle brackets are properly balanced – all left angle brackets < must be "closed" with right angle brackets > before another occurrence of a left angle bracket.
#
# Write code that, given a character scalar or vector representing some XML, returns 1 if the angle brackets are properly balanced and 0 if not.

# Solution
Solution ← ⬚1/↧⦷"<>"▽⊸∊"<>"

# Tests
⍤⤙≍ 1 Solution "<name><first>Drake</first><last>Mallard</last></name>"
⍤⤙≍ 0 Solution "<math><relation>2<3</relation></math>"
⍤⤙≍ 1 Solution "" # an empty vector is balanced
⍤⤙≍ 0 Solution ">stuff<>/stuff<"
⍤⤙≍ 0 Solution "<"
