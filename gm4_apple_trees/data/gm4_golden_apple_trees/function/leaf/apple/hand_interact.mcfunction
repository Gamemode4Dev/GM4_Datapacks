# update leaf stage
# @s = player taking apple from tree with empty hand
# located at @s
# run from advancement apple_hand_empty

advancement revoke @s only gm4_golden_apple_trees:apple_hand_empty

playsound minecraft:entity.item_frame.remove_item block @a[distance=..8] ~ ~ ~ 0.3 0.6

# update armour stand
execute positioned ^ ^ ^2.5 as @e[type=minecraft:armor_stand,tag=gm4_golden_apple,tag=gm4_ripe_apple,distance=..3,sort=nearest,limit=1,predicate=!gm4_golden_apple_trees:apple_holding] at @s align xyz run function gm4_golden_apple_trees:leaf/set_stage/0