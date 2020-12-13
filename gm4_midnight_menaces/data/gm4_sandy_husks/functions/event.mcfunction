# @s = none
# at world spawn
# called by midnight menaces base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

execute as @e[type=minecraft:zombie,tag=!gm4_sandy_husk_checked,nbt={PersistenceRequired:0b},nbt=!{DeathLootTable:"minecraft:empty"}] at @s run function gm4_sandy_husks:convert
