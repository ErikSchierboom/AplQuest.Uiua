# 2023-10: Partition with a Twist
# Splitting delimited data into sub-arrays using partitioning on a delimiter character (or characters) is a fairly common operation in APL. For instance, if you partition the character vector "this is an example" on each occurrence of the space character, there would be 4 sub-arrays: "this" "is" "an" "example". This problem adds a slight twist to the operation in that the left argument indicates how many sub-arrays to return.
#
# Write code that:
#
# takes a non-negative integer left argument, N
# takes a space-delimited character vector right argument, string
# returns an array of length N where:
# if N is less than or equal to the number of sub-arrays in string, the first N-1 elements of the result are the first N-1 space-delimited partitions in string.
# The Nth element of the result is the remaining portion of string.
# if N is greater than the number of sub-arrays, pad the result with as many empty arrays as necessary to achieve length N.
# Note: Each space in string be considered as a delimiter. This means that leading, trailing, or contiguous spaces are potentially significant.

Solution ← (
  ⊙(⊂@ )
  ⊙⊸(-1\+=@ )
  ⟜(↧-1)
  ⊙⊕(□↘1)
  ⊂{}⬚(□"")↙
)

⍤⤙≍ {"this is a sample"} Solution 1 "this is a sample"
⍤⤙≍ {"this" "is a sample"} Solution 2 "this is a sample"
⍤⤙≍ {"this" "is" "a" "sample"} Solution 4 "this is a sample"
⍤⤙≍ {"" "" "this" "" "is" "" "a" "sample" "" "" "" "" ""} Solution 13 "  this  is  a sample  " # note the leading, trailing, and multiple interior spaces 
⍤⤙≍ {} Solution 0 "this is a sample"                                                           # returns an empty vector
⍤⤙≍ {"" "" "" ""} Solution 4 ""
