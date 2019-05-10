#@s = none
#at world spawn
#called by mysterious midnights base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

execute as @e[type=skeleton,tag=!gm4_icy_stray,nbt={HandItems:[{id:"minecraft:bow",Count:1b},{}],PersistenceRequired:0b}] at @s run function icy_strays:convert