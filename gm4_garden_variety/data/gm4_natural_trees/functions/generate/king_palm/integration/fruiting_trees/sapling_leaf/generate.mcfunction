# places a TREE_TYPE sapling leaf marker
# run from TODO

# place leaf marker
execute align xyz run summon marker ~0.5 ~ ~0.5 {CustomName:'"King Palm Sapling Leaf"',Tags:["gm4_fruiting_leaf_new"]}

# store nbt
data modify entity @e[type=marker,distance=..1,limit=1,tag=gm4_fruiting_leaf_new] data.gm4_garden_variety set from storage gm4_garden_variety:data/garden_variety_nbt tree

# initialize
execute as @e[type=marker,tag=gm4_fruiting_leaf_new,limit=1] at @s run function gm4_natural_trees:generate/king_palm/integration/fruiting_trees/sapling_leaf/initialize
