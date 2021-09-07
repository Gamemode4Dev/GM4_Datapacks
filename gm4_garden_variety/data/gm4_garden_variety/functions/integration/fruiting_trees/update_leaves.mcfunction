# checks whether @s is a gm4 king palm fruit leaf, and if so allows further evaluation of the age
# @s any gm4_fruiting_leaf
# at @s align xyz
# run from #gm4_fruiting_trees:tree/leaf/fruiting/age

execute if entity @s[tag=gm4_red_berry_fruit_leaf] run function gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/red_berry/advance_stage
execute if entity @s[tag=gm4_apple_fruit_leaf] run function gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/apple/advance_stage
