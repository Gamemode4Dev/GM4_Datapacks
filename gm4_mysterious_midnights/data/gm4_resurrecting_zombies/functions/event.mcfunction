#@s = none
#at world spawn
#called by mysterious midnights base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

execute as @e[type=item,nbt={Item:{id:"minecraft:rotten_flesh"},OnGround:1b}] run function resurrecting_zombies:mark_rotten_flesh
execute as @e[type=item,scores={gm4_rezombify=8..}] at @s run function resurrecting_zombies:spawn_zombie
