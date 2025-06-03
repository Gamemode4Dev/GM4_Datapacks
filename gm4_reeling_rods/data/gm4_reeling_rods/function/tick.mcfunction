# reset clear all id tags
execute as @e[tag=gm4_reeling_rods.id.tagged] run function gm4_reeling_rods:id/clear

# set new id tags if needed
# distance from bobber to entity is ..42 as that represents a vanilla entity of 3.28 blocks tall at a max of 16x scale and then 80% of the height to find the fishing bobber
execute as @e[type=minecraft:fishing_bobber] at @s as @e[type=!#gm4_reeling_rods:ignore,distance=..42] at @s run function gm4_reeling_rods:id/set

# 5 ticks is good enough response time
schedule function gm4_reeling_rods:tick 5t
