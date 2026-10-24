# 2019-10: Odds & Evens
# Given a vector of words, separate the words into two vectors – one containing all the words that have an odd number of letters and the other containing all the words that have an even number of letters.

Solution ← {⊃(▽¬|▽)}⊸≡◇(=₀◿₂⧻)

⍤⤙≍ {{"the" "great"} {"plan" "is"}} Solution {"the" "plan" "is" "great"}
⍤⤙≍ {{"all" "odd"} {}} Solution {"all" "odd"}                   # note the empty 2nd element of the result
⍤⤙≍ {{} {"only" "even" "here"}} Solution {"only" "even" "here"} # note the empty 1st element of the result
