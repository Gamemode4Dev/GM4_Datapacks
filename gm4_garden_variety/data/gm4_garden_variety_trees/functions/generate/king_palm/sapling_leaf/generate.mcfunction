# generates the sapling leaf
# @s = @e[type=marker,tag=gm4_tree_palm_marker]
# at @s
# run from gm4_garden_variety_trees:generate/TREE_TYPE/sapling_leaf/attempt


# debug
data modify storage gm4_garden_variety:debug/generation path append value "s"

# place leaf block
setblock ~ ~ ~ birch_leaves[persistent=true] replace 

# track how many leaves have generated
scoreboard players remove $sapling_leaves gm4_gv_tree_gen 1

# place leaf marker
execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {CustomName:'"King Palm Sapling Leaf"',Tags:["gm4_gv_new_sapling_leaf"]}

# store nbt
data modify entity @e[type=marker,distance=..1,limit=1,tag=gm4_gv_new_sapling_leaf] data.gm4_garden_variety set from storage gm4_garden_variety:transfer/gv_nbt tree_offspring

# initialize
execute as @e[type=marker,tag=gm4_gv_new_sapling_leaf,limit=1] at @s run data merge entity @s {Tags:["gm4_gv_sapling_leaf","gm4_king_palm_sapling_leaf"]}
