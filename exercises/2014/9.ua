# 2014-9: Going Ballistic
# The following formula gives the horizontal distance a projectile travels:
# d = v^2 * sin(2θ) / G
#
# Where: v is the initial velocity, θ is the trajectory in degrees, d is the horizontal distance and G is the gravitational constant.
# Write code which calculates the distance (in meters) a projectile travels given an initial velocity in meters per second and a trajectory in degrees. Use 9.8 meters per second squared as the gravitational constant.

# Solution
Solution ← ÷ 9.8 ×⊓(ⁿ₂|∿ ÷180 ×π ×2)

# Tests
⍤⤙≍ 1020.408163 ⁅₆ Solution 100 45 # 100 meters per second and 45 degree trajectory

⍤⤙≍ 0 Solution 0 45 # no velocity = no distance

⍤⤙≍ 1.249639591E¯13 ⁅₂₂ Solution 100 90 # shooting straight up = no distance
