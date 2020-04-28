#@s = none
#at world spawn
#called by midnight menaces base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

execute as @e[tag=!gm4_sandy_husk,type=zombie,nbt={PersistenceRequired:0b},nbt=!{DeathLootTable:"minecraft:null"}] unless score @s gm4_menace matches 0.. at @s run function gm4_sandy_husks:convert
