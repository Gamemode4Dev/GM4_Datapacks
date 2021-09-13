# checks whether @s is a fruit leaf, and if so allows further evaluation of the age
# @s = @e[type=armor_stand,tag=gm4_fruiting_leaf]
# at @s align xyz
# run from #gm4_fruiting_trees:tree/leaf/fruiting/age


execute if entity @s[tag=gm4_red_berry_fruit_leaf] run function gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/red_berry/advance_stage
