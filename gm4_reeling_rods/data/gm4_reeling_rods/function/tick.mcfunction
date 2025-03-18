# reset clear all id tags
execute as @e[tag=gm4_reeling_rods.id.tagged] run function gm4_reeling_rods:id/clear
# set new id tags if needed
execute as @e[type=minecraft:fishing_bobber] at @s as @e[type=!#gm4_reeling_rods:ignore,distance=..42] at @s run function gm4_reeling_rods:id/set

schedule function gm4_reeling_rods:tick 1t
