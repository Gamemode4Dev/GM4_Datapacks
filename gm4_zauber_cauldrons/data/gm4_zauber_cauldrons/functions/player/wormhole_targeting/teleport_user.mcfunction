# @s = user to pe teleported by wormhole
# at target location of wormhole
# run from player/wormhole_targeting/set_dimension
# this function exists as this ensures that the tag "gm4_zc_wormhole_consumer" is removed. 
# Testing in 1.16.5 showed that, for non-player entities, the tag isn't removed as expected in prepare_teleport line 24.
# This lead to entities with leftover tags, which would break teleportation server wide, as those entities might be teleported instead.
# Keep testing whether this is still necessary in future versions.
# Note that this would not be an issue in vanilla zauber, however, zauber liquids allows the teleportation of non-player entities.

# remove tag
tag @s remove gm4_zc_wormhole_consumer

# teleport
tp @s ~.5 ~.7 ~.5
