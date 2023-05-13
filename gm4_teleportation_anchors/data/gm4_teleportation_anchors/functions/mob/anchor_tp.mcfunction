# @s = enderman or shulker to be moved to a tp anchor
# located 1 block above the teleportation anchor
# run from move_mob

tp @s ~ ~-0.45 ~
function gm4_teleportation_anchors:mob/track_movement/initialize_pos
tag @s add gm4_ta_anchor_tp

execute if entity @s[type=enderman] run playsound minecraft:entity.enderman.teleport block @a[distance=..8] ~ ~ ~ 1 0.3
execute if entity @s[type=shulker] run playsound minecraft:entity.shulker.teleport block @a[distance=..8] ~ ~ ~ 1 0.3
execute if entity @s[type=enderman] run particle minecraft:portal ~ ~0.5 ~ 0.2 1.6 0.2 0.01 150
execute if entity @s[type=shulker] run particle minecraft:portal ~ ~0.5 ~ 0.2 0 0.2 0.01 50
particle minecraft:explosion ~ ~0.5 ~ 0 0 0 0 0
