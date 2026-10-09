# 2016-9: Delimited Text
# It's common to encounter delimited text – for example, comma- separated values in a file.
# 
# Write a function that takes a character vector as its right argument and one or more characters as its left argument, where those characters are delimiters in the right argument. The function should return the delimited text as a vector of boxes.

Split ← ⊜□⊸(¬∊)

⍤⤙≍ {"comma" "delimited" "values"} Split "," "comma,delimited,values"
⍤⤙≍ {"break" "up" "words"} Split " " "break up words"
⍤⤙≍ [] Split "," ","
