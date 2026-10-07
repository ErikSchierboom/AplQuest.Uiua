# 2014-9: Going Ballistic
# The following formula gives the horizontal distance a projectile travels:
# Where: v is the initial velocity, θ is the trajectory in degrees, d is the horizontal distance and G is the gravitational constant.
# Write a function which calculates the distance (in meters) a projectile travels given an initial velocity in meters per second and a trajectory in degrees. Use 9.8 meters per second squared as the gravitational constant.

Distance ← ÷ 9.8 ×⊓(ⁿ₂|∿ ÷180 ×π ×2)

⍤⤙≍ 1020.408163 ⁅₆ Distance 100 45      # 100 meters per second and 45 degree trajectory
⍤⤙≍ 0 Distance 0 45                     # no velocity = no distance
⍤⤙≍ 1.249639591E¯13 ⁅₂₂ Distance 100 90 # shooting straight up = no distance
