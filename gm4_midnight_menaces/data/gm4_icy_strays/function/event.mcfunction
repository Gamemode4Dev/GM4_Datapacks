# @s = none
# at world spawn
# called by midnight menaces base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

execute as @e[type=minecraft:skeleton,tag=!smithed.entity,tag=!gm4_icy_stray_checked,x=0,predicate=gm4_icy_strays:stray_convert_chance,nbt={PersistenceRequired:0b}] unless data entity @s DeathLootTable at @s run function gm4_icy_strays:stray_transform
tag @e[type=skeleton] add gm4_icy_stray_checked
