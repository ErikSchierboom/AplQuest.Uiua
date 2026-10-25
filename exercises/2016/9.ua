# 2016-9: Delimited Text
# It's common to encounter delimited text – for example, comma- separated values in a file.
# 
# Write code that takes a character vector as its second argument and one or more characters as its first argument, where those characters are delimiters in the second argument. The code should return the delimited text as a vector of boxes.

# Solution
Solution ← ⊜□⊸(¬∊)

# Tests
⍤⤙≍ {"comma" "delimited" "values"} Solution "," "comma,delimited,values"
⍤⤙≍ {"break" "up" "words"} Solution " " "break up words"
⍤⤙≍ [] Solution "," ","
