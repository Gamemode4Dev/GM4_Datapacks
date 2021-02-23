#@s = people with levity boots, sneaking.
#at @s
#run from levity_shamir:find_floating_players

#creation of new region, check for boots in case player took them of (bugfix)
execute if entity @s[nbt={OnGround:1b}] unless predicate gm4_levity_shamir:has_levity_effects run function gm4_levity_shamir:initiate_region

#outside region
execute if entity @e[type=area_effect_cloud,tag=gm4_levity_epicenter,limit=1,distance=..16] positioned ~-16 ~-1 ~-16 if entity @e[type=area_effect_cloud,tag=gm4_levity_epicenter,limit=1,dx=31,dy=2,dz=31] run tag @s add gm4_levity_within_region
tag @s[tag=!gm4_levity_within_region] remove gm4_levity_is_floating
execute if entity @s[nbt={OnGround:0b},tag=!gm4_levity_is_floating] if predicate gm4_levity_shamir:has_levity_effects run function gm4_levity_shamir:stop/initiate_drifting

#Cloud particles
particle cloud ~ ~ ~ .2 .1 .2 .001 2 normal @a

#reset non shifting buffer
scoreboard players reset @s gm4_levity_buf
