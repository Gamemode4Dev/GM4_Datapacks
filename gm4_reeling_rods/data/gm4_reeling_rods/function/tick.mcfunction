# reset clear all id tags
execute as @e[tag=gm4_reeling_rods.id.tagged] run function gm4_reeling_rods:id/clear

execute as @a[scores={gm4_reeling_rods.rods_cast=1..}] at @s run function gm4_reeling_rods:player/cast_line

# 5 ticks is good enough response time
schedule function gm4_reeling_rods:tick 5t
