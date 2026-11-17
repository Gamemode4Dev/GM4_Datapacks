# spawns an apple
# @s = gm4_apple item display switching to stage 0
# at loot spawn location (where apple visually appears)
# run from gm4_apple_trees:leaf/set_stage/0
# and from gm4_apple_trees:leaf/apple/destroy

# spawn apple item
playsound minecraft:entity.item_frame.remove_item block @a[distance=..8] ~ ~ ~ 0.3 0.6
item replace entity @s contents with minecraft:air

# kill interaction
kill @e[type=interaction,tag=gm4_apple_interaction,limit=1,sort=nearest,distance=..0.5]

# visuals
loot spawn ~ ~-0.1 ~ loot gm4_apple_trees:blocks/apple
