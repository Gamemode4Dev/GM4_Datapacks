#@s = players sneaking on the ground wearing levity boots    at @s
#run from levity_shamir:player_sneaking

#kill off old epicenters
execute as @e[type=area_effect_cloud,tag=gm4_levity_epicenter,distance=..16] positioned ~-16 ~-1 ~-16 if entity @s[dx=31,dy=2,dz=31] run kill @s

#summon new epicenter
summon area_effect_cloud ~ ~ ~ {Duration:9600,CustomName:"\"gm4_levity_epicenter\"",Tags:["gm4_levity_epicenter"]}

#tag to mark they started floating
tag @s add gm4_levity_started_floating

#apply levitation
effect give @s levitation 480 255
effect give @s jump_boost 480 255 true
