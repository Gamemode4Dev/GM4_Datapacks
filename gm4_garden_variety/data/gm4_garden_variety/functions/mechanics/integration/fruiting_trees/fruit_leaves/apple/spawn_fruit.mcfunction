# spawns an apple
# @s = gm4_TREE_TYPE_fruit_leaf switching to stage 0
# at loot spawn location (in head of armor stand)
# run from gm4_garden_variety_trees:trees/TREE_TYPE/fruiting/leaf/fruit/set_stage/0

# spawn apple item
playsound minecraft:entity.item_frame.remove_item block @a[distance=..8] ~ ~ ~ 0.3 0.6

# visuals
loot spawn ~ ~ ~ loot gm4_garden_variety:items/fruit/apple
