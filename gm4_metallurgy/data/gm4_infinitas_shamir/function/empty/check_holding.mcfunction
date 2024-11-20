# Checks which hand player is holding an Infinitas Empty Bucket
# @s = player with Infinitas Empty Bucket in their inventory
# run from gm4_infinitas_shamir:empty/check_inventory

tag @s add gm4_has_empty_infinitas
tag @s[predicate=gm4_infinitas_shamir:mainhand/holding/empty] add gm4_infinitas_mainhand_empty
tag @s[predicate=gm4_infinitas_shamir:offhand/holding/empty] add gm4_infinitas_offhand_empty
