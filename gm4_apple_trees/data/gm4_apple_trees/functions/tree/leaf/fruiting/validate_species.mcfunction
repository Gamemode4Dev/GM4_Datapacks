# checks whether @s is an apple leaf, and if so allows further evaluation of the age
# @s any gm4_fruiting_leaf
# at @s align xyz
# run from #gm4_fruiting_trees:tree/leaf/fruiting/age

execute if entity @s[tag=gm4_apple_leaf] run function gm4_apple_trees:tree/leaf/fruiting/advance_stage
