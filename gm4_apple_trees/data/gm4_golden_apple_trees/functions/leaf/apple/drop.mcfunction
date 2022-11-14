# spawns an apple
# @s = gm4_apple_leaf switching to stage 0
# at loot spawn location (in head of armor stand or leaf block above the armor stand)
# run from gm4_apple_trees:leaf/set_stage/0
# and from gm4_apple_trees:leaf/apple/destroy

# spawn apple item
playsound minecraft:entity.item_frame.remove_item block @a[distance=..8] ~ ~ ~ 0.3 0.6
item replace entity @s weapon.offhand with minecraft:air
item replace entity @s weapon.mainhand with minecraft:air

# visuals
loot spawn ~ ~ ~ loot gm4_golden_apple_trees:blocks/golden_apple
