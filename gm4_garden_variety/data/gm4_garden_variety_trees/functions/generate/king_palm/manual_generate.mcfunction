# initializes the TREE_TYPE tree's AEC marker
# @s = TREE_TYPE generation AEC marker
# run from gm4_garden_variety_trees:generate/palm_tree/TREE_TYPE/fruiting/tree/generate & gm4_garden_variety_trees:orbis/chunk/generate

# set seed and generation mode
scoreboard players set $seed_mode_command gm4_gv_tree_gen 1
scoreboard players set $generation_mode_command gm4_gv_tree_gen 1

# summon trunk marker and begin generation
kill @s[type=!player]
execute align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["gm4_tree_trunk_marker"]}
execute as @e[type=marker,tag=gm4_tree_trunk_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety_trees:generate/king_palm/generate
