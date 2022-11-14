# converts sapling aec to marker
# @s = old aec sapling AEC
# located at @s
# run from gm4_apple_trees:verify/upgrade_aec_to_marker

summon marker ~ ~0.5 ~ {CustomName:'"gm4_apple_tree_sapling"',Tags:["gm4_tree_sapling","gm4_apple_tree_sapling","smithed.entity","smithed.strict","smithed.block"]}
scoreboard players set @e[type=marker,tag=gm4_apple_tree_sapling,distance=..0.1] gm4_sap_growth 2
scoreboard players set @e[type=marker,tag=gm4_apple_tree_sapling,distance=..0.1] gm4_entity_version 1
kill @s
