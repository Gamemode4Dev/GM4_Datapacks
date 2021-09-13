# handles operations on TREE_TYPE fruit leaves
# @s = any TREE_TYPE fruit leaf
# at @s align xyz positioned at the leaf block
# run from gm4_garden_variety:clock/16t

execute if entity @s[tag=!gm4_ripe_red_berry_fruit] positioned ~ ~1 ~ unless block ~ ~ ~ #minecraft:leaves run function gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/red_berry/destroy
execute if entity @s[tag=gm4_ripe_red_berry_fruit] positioned ~ ~2 ~ unless block ~ ~ ~ #minecraft:leaves run function gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/red_berry/destroy