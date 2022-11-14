# update leaf stage
# @s = player taking apple from tree with empty hand
# located at @s
# run from advancement apple_hand_empty

advancement revoke @s only gm4_apple_trees:apple_hand_empty

playsound minecraft:entity.item_frame.remove_item block @a[distance=..8] ~ ~ ~ 0.3 0.6
