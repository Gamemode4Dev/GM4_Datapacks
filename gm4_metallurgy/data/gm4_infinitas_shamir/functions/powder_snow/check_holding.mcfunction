# Checks which hand player is holding an Infinitas Powder Snow Bucket
# @s = player with Infinitas Powder Snow Bucket in their inventory
# run from gm4_infinitas_shamir:powder_snow/check_inventory

tag @s add gm4_has_powder_snow_infinitas
tag @s[predicate=gm4_infinitas_shamir:mainhand/holding/powder_snow] add gm4_infinitas_mainhand_powder_snow
tag @s[predicate=gm4_infinitas_shamir:offhand/holding/powder_snow] add gm4_infinitas_offhand_powder_snow
