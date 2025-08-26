# Checks if a fishing bobber belongs to the targeted owner
# @s = a fishing bobber
# at owner
# run from player/find_hooked_entity

return run execute on origin if entity @s[tag=gm4_reeling_rods.player]
