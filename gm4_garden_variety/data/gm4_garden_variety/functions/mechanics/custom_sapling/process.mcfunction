# processes the sapling every tick for stage change or broken block
# @s = sapling marker
# at @s align xyz
# run from gm4_fruiting_trees:tick

# destroy if not in a sapling
execute unless block ~ ~ ~ #minecraft:saplings run function gm4_garden_variety:mechanics/custom_sapling/destroy

# prevents normal trees from growing by preventing the sapling from reaching stage 2
# also allows saplings to run their own stage growth checks
execute if block ~ ~ ~ #minecraft:saplings[stage=1] run function gm4_garden_variety:mechanics/custom_sapling/advance_stage
