#@s = none
#at world spawn
#called by mysterious midnights base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

execute as @e[type=item,x=0] if items entity @s contents minecraft:rotten_flesh if entity @s[nbt={OnGround:1b}] run function gm4_resurrecting_zombies:mark_rotten_flesh
execute as @e[type=item,scores={gm4_rezombify=8..}] at @s run function gm4_resurrecting_zombies:spawn_zombie
