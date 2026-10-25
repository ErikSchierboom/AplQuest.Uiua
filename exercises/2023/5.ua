# 2023-5: Risky Business
# The board game Risk is a game of world domination where opposing players roll dice to determine the outcome of one player's armies attacking another's. The attacker can roll up to three 6-sided dice and the defender can roll up to two 6-sided dice. The resulting rolls are then individually compared from highest to lowest. If the attacker's die value is greater than the defender's, the defender loses one army. If the defender's die value is greater than or equal to the attacker's, the attacker loses one army. If one player rolls more dice than the other other player, the additional dice are not considered in the evaluation. For this problem, we'll generalize the task by allowing any number of dice for either the attacker or defender, and any integer values in the arguments.
#
# Write code that:
#
# - takes a non-empty, descending integer vector first argument representing the attacker's dice rolls
# - takes a non-empty, descending integer vector second argument representing the defender's dice rolls
# - returns a 2-element vector where the first element represents the number of armies the attacker lost and the second element represents the number of armies the defender lost.
# Note: The first and second arguments do not need to be the same length.

# Solution
Solution ← [∩/+]⊃≥<↙◡(↧∩⧻)

# Tests
⍤⤙≍ [0 1] Solution [6] [5]
⍤⤙≍ [2 1] Solution [6 6 4 2 1] [6 5 5] # attacker loses 2 armies, defender loses 1 army
