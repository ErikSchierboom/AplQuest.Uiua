# 2018-5: What's Your Sign? Revisited
# In Western astrology, the Zodiac is based on twelve 30° sectors of the ecliptic. Although the exact dates in a given year may shift by a day, the general dates for each sign are:
#
# Aries   March 21–April 19        Libra September 23–October 22
# Taurus  April 20–May 20          Scorpio October 23–November 21
# Gemini  May 21–June 20           Sagittarius November 22–December 21
# Cancer  June 21–July 22          Capricorn December 22–January 19
# Leo     July 23–August 22        Aquarius January 20–February 18
# Virgo   August 23–September 22   Pisces February 19–March 20
#
# Write a function that, given a 2-element integer vector representing month and day, returns a character vector (string) of the corresponding Western zodiac sign.

Zodiac ← ⨬(
  ⍤"Invalid month"
| ⨬("Capricorn"|"Aquarius")>19    # January
| ⨬("Aquarius"|"Pisces")>18       # February
| ⨬("Pisces"|"Aries")>20          # March
| ⨬("Aries"|"Taurus")>19          # April
| ⨬("Taurus"|"Gemini")>20         # May
| ⨬("Gemini"|"Cancer")>20         # June
| ⨬("Cancel"|"Leo")>22            # July
| ⨬("Leo"|"Virgo")>22             # August
| ⨬("Virgo"|"Libra")>22           # September
| ⨬("Libra"|"Scorpio")>22         # October
| ⨬("Scorpio"|"Sagittarius")>21   # November
| ⨬("Sagittarius"|"Capricorn")>21 # December
| )

⍤⤙≍ "Pisces" Zodiac 2 23   # February 23
⍤⤙≍ "Scorpio" Zodiac 10 31 # October 31
