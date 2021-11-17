# @s = player taking apple from tree with empty hand
# at @s
# run from advancement apple_hand_empty

advancement revoke @s only gm4_apple_trees:apple_hand_empty

playsound minecraft:entity.item_frame.remove_item block @a[distance=..8] ~ ~ ~ 0.3 0.6

execute positioned ^ ^ ^2.5 as @e[type=minecraft:armor_stand,tag=gm4_ripe_apple,distance=..3,sort=nearest,limit=1,predicate=!gm4_apple_trees:apple_holding] at @s align xyz run function gm4_apple_trees:tree/leaf/fruiting/set_stage/0
