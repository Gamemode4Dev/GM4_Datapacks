#@s = people with levity boots, sneaking.
#at @s
#run from levity_shamir:find_floating_players

#creation of new region
execute if entity @s[nbt={OnGround:1b}] run function levity_shamir:initiate_region

#outside region
execute if entity @s[nbt={OnGround:0b},tag=!gm4_levity_started_floating] run function levity_shamir:initiate_drifting

particle cloud ~ ~ ~ .2 .1 .2 .001 2 normal @a
