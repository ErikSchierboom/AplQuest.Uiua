# 2022-7: Just Golfing Around
# Apologies to the code golfers out there, but this problem has nothing to do with code golf! Instead, it addresses the problem of assigning places in a golf tournament. In regular golf, lower scores place higher – the lowest score places first and the highest score places last.

# Write a function that:

# takes a right argument that is a non-decreasing vector or scalar of strictly positive integers, representing a set of scores.
# returns a numeric vector of the place for each score; for duplicate scores, it returns the average of the places they hold.

GolfScores ← /◇⊂⊕(□↯⊃([∘]|÷) ⊃(⧻|/+))⊃(⊛|+₁⇡⧻)

⍤⤙≍ [1 2 3 4 5] GolfScores [1 2 3 4 5]
⍤⤙≍ [1 2.5 2.5 4] GolfScores [68 71 71 73]
⍤⤙≍ [1 2.5 2.5 4 6 6 6 8 9] GolfScores [67 68 68 69 70 70 70 71 72]
⍤⤙≍ [3.5 3.5 3.5 3.5 3.5 3.5] GolfScores [70 70 70 70 70 70]
⍤⤙≍ [] GolfScores []  # this should return an empty vector
⍤⤙≍ [1] GolfScores 67 # should work with a scalar argument
