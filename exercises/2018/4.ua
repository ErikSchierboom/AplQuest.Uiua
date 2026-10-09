# 2018-4: What's Your Sign?
# The Chinese animal zodiac is a repeating cycle of 12 years, with each year being represented by an animal.
# The signs for the last 12 years are:
#
# 2018 Dog      2012 Dragon
# 2017 Rooster  2011 Rabbit
# 2016 Monkey   2010 Tiger
# 2015 Goat     2009 Ox
# 2014 Horse    2008 Rat
# 2013 Snake    2007 Pig
# Note that the year 1 AD (represented as 1) follows the year 1 BC (represented as ¯1) with no intervening "0" year.
#
# Write a function that, given a scalar integer year, returns a character vector (string) of the Chinese zodiac sign for that year. For the purposes of this problem, assume that each year number corresponds to exactly one Chinese zodiac animal.

Zodiac ← °□ ⊡⟜{"Monkey" "Rooster" "Dog" "Pig" "Rat" "Ox" "Tiger" "Rabbit" "Dragon" "Snake" "Horse" "Goat"} ◿12 -⊸(↧0±)

⍤⤙≍ "Dog" Zodiac 2018 # Newborns in 2018 will be Dogs
⍤⤙≍ "Rat" Zodiac 1564 # William Shakespeare b. 1564
⍤⤙≍ "Dog" Zodiac ¯551 # Confucius b. 551 BC
