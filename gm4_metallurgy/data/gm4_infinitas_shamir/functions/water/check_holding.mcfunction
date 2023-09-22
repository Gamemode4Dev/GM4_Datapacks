# Checks which hand player is holding an Infinitas Water Bucket
# @s = player with Infinitas Water Bucket in their inventory
# run from gm4_infinitas_shamir:water/check_inventory

tag @s add gm4_has_water_infinitas
tag @s[predicate=gm4_infinitas_shamir:mainhand/holding/water] add gm4_infinitas_mainhand_water
tag @s[predicate=gm4_infinitas_shamir:offhand/holding/water] add gm4_infinitas_offhand_water
