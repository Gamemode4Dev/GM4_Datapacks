#@s = players wearing levity boots at @s
#run from metallurgy:has_shamir

scoreboard players set levity_active gm4_ml_data 1
tag @s add gm4_has_levity

#check if player is inside region
tag @s remove gm4_levity_within_region
execute if entity @e[type=area_effect_cloud,tag=gm4_levity_epicenter,limit=1,distance=..16] positioned ~-16 ~-1 ~-16 if entity @e[type=area_effect_cloud,tag=gm4_levity_epicenter,limit=1,dx=31,dy=2,dz=31] run tag @s add gm4_levity_within_region

#exit levity region
execute if entity @s[tag=gm4_levity_started_floating,tag=!gm4_levity_within_region] run function gm4_levity_shamir:initiate_drifting
