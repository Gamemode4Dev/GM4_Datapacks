# spawns the fruit
# @s = gm4_TREE_TYPE_fruit_leaf switching to stage 0
# at loot spawn location (in head of armor stand)
# run from gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/red_berry/set_stage/0
# run from gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/red_berry/destroy


# spawn apple item
playsound minecraft:entity.item_frame.remove_item block @a[distance=..8] ~ ~ ~ 0.3 0.6

# visuals
loot spawn ~ ~ ~ loot gm4_garden_variety:items/fruit/red_berry
