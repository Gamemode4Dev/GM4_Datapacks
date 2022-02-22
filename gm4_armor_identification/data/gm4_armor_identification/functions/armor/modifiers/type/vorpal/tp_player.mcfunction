# run from armor/active/vorpal/attempt
# @s = player wearing vorpal armor being damaged
# at @s
# code taken from Orb of Ankou - expeditious

# effects
execute at @e[type=marker,tag=gm4_ai_vorpal,distance=..16] align xyz run tp @s ~0.5 ~ ~0.5
kill @e[type=marker,tag=gm4_ai_vorpal]

execute at @s as @a[distance=..16] at @s run playsound entity.enderman.teleport player @s ~ ~ ~ 0.8 0.8
execute at @s run particle portal ~ ~0.8 ~ 0.2 0.4 0.2 1 16

# compatibility with teleportation anchors
execute if score gm4_teleportation_anchors load matches 1.. run function gm4_teleportation_anchors:player/used_chorus
