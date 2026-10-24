# 2023-6: Key/Value Pairs
# Representing data as key/value pairs (also known as name/value pairs) is a very common technique. For example, it can be found in query strings in HTTP URIs, attribute settings in HTML elements, and in JSON objects. One common representation for a key/value pair is to have a character key (name) followed by an equals sign (=) followed by the value. Multiple key/value pairs can be separated by a delimiter character or characters. For example:
# 
# key1=value1;key2=value2
# Write a function that:
# 
# takes a 2-element character vector left argument where the first element represents the separator character between multiple key/value pairs and the second element represents the separator between the key and the value for each pair.
# takes a character vector right argument representing a valid set of key/value pairs (delimited as specified by the left argument).
# returns a 2-column matrix where the first column contains the character vector keys of the key/value pairs and the second column contains the character vector values.
# Note: You may assume that there will be no empty names or values in the right argument.

Solution ← (
  °⊟
  ⊃(⊜□⊸(≠⊙⋅)|⋅∘)
  ⍚(⊜□⤚˜≠)
)

Expected ← {{"language" "APL"}
            {"dialect" "Dyalog"}}
⍤⤙≍ Expected Solution " =" "language=APL dialect=Dyalog"

Expected ← {{"duck" "donald"}}
⍤⤙≍ Expected Solution ";:" "duck:donald"

Expected ← {
  {"name" "Morten"}
  {"name" "Brian"}
  {"name" "Adám"}
}
⍤⤙≍ Expected Solution "/:" "name:Morten/name:Brian/name:Adám"
