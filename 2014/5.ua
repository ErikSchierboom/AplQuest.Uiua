# 2014-5: Mirror Mirror
# A palindrome is a word or phrase whose letters read the same forwards and backwards. Write a function which returns a 1 if its character vector argument is a palindrome, 0 otherwise. For simplicity"s sake, you may assume that the vector is all one case.

IsPalindrome ← ≍⊸⇌▽⊸(⌵±)

⍤⤙≍ 1 IsPalindrome "a man, a plan, a canal, panama!"
⍤⤙≍ 1 IsPalindrome ""
⍤⤙≍ 1 IsPalindrome "a"
⍤⤙≍ 0 IsPalindrome "APL"
