#@s = none
#at world spawn
#called by mysterious midnights base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

execute as @e[type=skeleton,tag=!smithed.entity,tag=!gm4_tipped_skeleton,x=0,nbt={HandItems:[{id:"minecraft:bow",Count:1b},{}],PersistenceRequired:0b}] at @s run function gm4_tipped_skeletons:tipp
