# 2018-1: Oh Say Can You See?
# Imagine standing in front of a line of skyscrapers of varying heights. Assume that you can always see a skyscraper that is taller than a closer skyscraper. For example, a person on the left of the diagram below can see 3 skyscrapers – the first, fourth, and sixth from left to right. In contrast, a person on the right can see 2 skyscrapers – the seventh and sixth.
#
#                                     ┌───┐
#                                     │   │
#                                     │   │
#                                     │   │
#                                     │   │
#                       ┌───┐         │   │  ┌───┐
#                       │   │         │   │  │   │
#                       │   │         │   │  │   │
#                       │   │         │   │  │   │
#                       │   │         │   │  │   │
#  ┌───┐  ┌───┐         │   │         │   │  │   │
#  │   │  │   │         │   │         │   │  │   │
#  │   │  │   │         │   │  ┌───┐  │   │  │   │
#  │   │  │   │  ┌───┐  │   │  │   │  │   │  │   │
#  │   │  │   │  │   │  │   │  │   │  │   │  │   │
#  │ 5 │  │ 5 │  │ 2 │  │ 10 │  │ 3 │  │ 15 │  │ 10 │
# ─┘   └──┘   └──┘   └──┘   └──┘   └──┘   └──┘   └─
# Write a function that, given a scalar or vector of skyscraper heights from closest to furthest, will return an integer representing the number of skyscrapers that can be seen.

NumberOfSkyscrapers ← ⧻◴\↥

⍤⤙≍ 3 NumberOfSkyscrapers [5 5 2 10 3 15 10]   # from the left person's view
⍤⤙≍ 2 NumberOfSkyscrapers ⇌ [5 5 2 10 3 15 10] # from the right person's view
⍤⤙≍ 0 NumberOfSkyscrapers []                   # no skyscrapers here!
⍤⤙≍ 1 NumberOfSkyscrapers [10]                 # single skyscraper
