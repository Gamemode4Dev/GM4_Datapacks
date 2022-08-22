# code taken from Orb of Ankou - expeditious
# @s = player wearing vorpal armor being damaged
# at @s
# run from armor/type/vorpal/attempt

# effects
execute at @e[type=marker,tag=gm4_ce_vorpal,distance=..16] align xyz run tp @s ~0.5 ~ ~0.5
kill @e[type=marker,tag=gm4_ce_vorpal]

playsound entity.enderman.teleport player @a ~ ~ ~ 0.8 1.2
execute at @s run playsound entity.enderman.teleport player @a ~ ~ ~ 0.8 0.8
execute at @s run particle portal ~ ~0.8 ~ 0.2 0.4 0.2 1 16

# compatibility with teleportation anchors
execute if score gm4_teleportation_anchors load.status matches 1 run function gm4_teleportation_anchors:player/used_chorus
