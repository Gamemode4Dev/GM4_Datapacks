# spawns an apple
# @s = gm4_apple_leaf switching to stage 0
# at loot spawn location (in head of armor stand)
# run from gm4_apple_trees:tree/leaf/fruting/set_stage/0

# spawn apple item
playsound minecraft:entity.item_frame.remove_item block @a[distance=..8] ~ ~ ~ 0.3 0.6

# visuals
loot spawn ~ ~ ~ loot gm4_apple_trees:blocks/ripe_apple_leaf
