# Checks which hand player is holding an Infinitas Lava Bucket
# @s = player with Infinitas Lava Bucket in their inventory
# run from gm4_infinitas_shamir:lava/check_inventory

tag @s add gm4_has_lava_infinitas
tag @s[predicate=gm4_infinitas_shamir:mainhand/holding/lava] add gm4_infinitas_mainhand_lava
tag @s[predicate=gm4_infinitas_shamir:offhand/holding/lava] add gm4_infinitas_offhand_lava
