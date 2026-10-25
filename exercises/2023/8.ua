# 2023-8: Critical Thinking
#
# The biorhythm theory is a pseudo-scientific idea that one's life is affected by three rhythmic cycles beginning from one's date of birth. The cycles are:
#
# The Physical cycle, with a periodicity of 23 days, affecting co-ordination, strength, and general well-being
# The Emotional cycle, with a periodicity of 28 days, affecting creativity, sensitivity, mood, perception, and awareness
# The Intellectual cycle, with a periodicity of 33 days, affecting alertness, analytical functioning, logical analysis, memory, and communication
# "Critical days" are days when a cycle crosses the x-axis in either direction and are purported to be accompanied by unstable conditions in the corresponding area.
# A "double critical day" occurs when two of the three cycles cross the x-axis on the same day.
# Starting from one's birthdate, double critical days occur on multiples of the least common multiple of the half of the periodicities of the two involved cycles.
#  Thus Physical-Emotional, Physical-Intellectual and Emotional-Intellectual double critical days can be calculated respectively using multiples of:
#
# # Experimental!
# ≡(÷⊃∨×∩÷₂) [23 23 28] [28 33 33]
# [322 379.5 462]
# Fortunately, the dreaded "triple critical day", when all three cycles cross the x-axis on the same day, only occurs every (∧/23 28 33÷2) or 10,626 days (a bit more than 29 years).
#
# Write a function that:
#
# takes a 3-element integer left argument representing a valid birthdate
# takes a 3-element integer right argument representing a valid date occurring on or after the left argument
# returns a 3-element integer array representing the date of the next double or triple critical day occurring on or after the date represented by the right argument.
# Note: All the dates in this specification are to be in the form year month day

# Experimental!

Solution ← (
  ⊸(-∩(÷86400°datetime))
  ⧅<2÷₂23_28_33
  ≡(÷⊃∨×°⊟)
  ×86400/↧⌵◿¯
  ˜⍜(°datetime|+)
  ↙₃
)

⍤⤙≍ [2023 9 10] Solution [1971 10 31] [2023 1 1]
⍤⤙≍ [1984 2 23] Solution [1984 2 23] [1984 2 23] # one's birthdate is a triple critical day
