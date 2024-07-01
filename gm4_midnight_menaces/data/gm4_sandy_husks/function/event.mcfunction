# @s = none
# at world spawn
# called by midnight menaces base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

execute as @e[type=minecraft:zombie,tag=!smithed.entity,tag=!gm4_sandy_husk_checked,x=0,predicate=gm4_sandy_husks:husk_convert_chance,nbt={PersistenceRequired:0b}] unless data entity @s DeathLootTable at @s run function gm4_sandy_husks:husk_transform
tag @e[type=zombie] add gm4_sandy_husk_checked
