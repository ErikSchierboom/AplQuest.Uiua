# 2019-6: Telephone Names
# 1	2ABC	3DEF
# 4GHI	5JKL	6MNO
# 7PQRS	8TUV	9WXYZ
# *	0	#
# Some telephone keypads have letters of the alphabet embossed on their keytops.
#  Some people like to remember phone numbers by converting them to an alphanumeric form using one of the letters on the corresponding key.
#  For example, in the keypad shown, "ALSMITH" would correspond to the number 257-6484 and "1DYALOGBEST" would correspond to 1-392-564-2378.
# 
# Write code that takes a character vector right argument that consists of digits and uppercase letters and returns an integer vector of the corresponding digits on the keypad.

Solution ← -@0⍜(▽|˜⊏▽3_3_3_3_3_4_3_4+@0+2⇡8-@A)⊸±

⍤⤙≍ [4 2 6 9 9 4 8] Solution "IAMYY4U"
⍤⤙≍ [] Solution ""
⍤⤙≍ [8 7 2 2 8 8 3] Solution "UR2CUTE"
