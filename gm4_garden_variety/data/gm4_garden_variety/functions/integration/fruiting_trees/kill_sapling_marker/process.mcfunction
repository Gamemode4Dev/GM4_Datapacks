# checks whether @s is a gm4 king palm fruit leaf, and if so allows further evaluation of the age
# @s any gm4_fruiting_leaf
# at @s align xyz
# run from #gm4_fruiting_trees:tree/leaf/fruiting/age

# destroy if not in a sapling
execute unless block ~ ~ ~ #minecraft:saplings run function gm4_garden_variety:integration/fruiting_trees/kill_sapling_marker/destroy

# prevents normal trees from growing by preventing the sapling from reaching stage 2
# also allows saplings to run their own stage growth checks
execute if block ~ ~ ~ #minecraft:saplings[stage=1] run function gm4_fruiting_trees:sapling/advance_stage
