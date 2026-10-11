# 2023-4: Like a Version
# One common software version numbering scheme is known as "semantic versioning". Typically, semantic versioning uses three numbers representing a major version number, a minor version number, and a build number.
# 
# The major version is incremented when a new version of the software introduces changes that would make existing applications using the software fail or behave differently.
# The minor version is incremented when new features are added that didn't previously exist — no pre-existing use of the software will fail in this case.
# The build number is incremented for bug fixes and similar changes.
# Write a function that:
# 
# Takes 3-element integer vector left and right arguments each representing a major version, minor version, and build number.
# Returns
# ¯1 if the left argument represents a version number older than the right argument
#  0 if the left argument represents a version number equal to the right argument
#  1 if the left argument represents a version number newer than the right argument

Compare ← /+ ×[4 2 1] ≡±˜-

⍤⤙≍ 0 Compare [1 2 3] [1 2 3]
⍤⤙≍ 1 Compare [1 2 3] [1 0 9]
⍤⤙≍ ¯1 Compare [14 2 11] [14 2 12]
