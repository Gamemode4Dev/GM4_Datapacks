# updates entities with new tags
# @s = old sapling marker
# located at world spawn
# run from gm4_apple_trees:verify/upgrade_fruiting_to_general

data merge entity @s {CustomName:'"gm4_apple_tree_sapling"',Tags:["gm4_tree_sapling","gm4_apple_tree_sapling","smithed.entity","smithed.strict","smithed.block"]}
scoreboard players set @s gm4_entity_version 1
