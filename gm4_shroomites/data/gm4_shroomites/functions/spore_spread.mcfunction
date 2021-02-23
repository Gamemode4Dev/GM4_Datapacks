#@s = @e[tag=gm4_shroomite_spore,type=area_effect_cloud,scores={gm4_shroom_time=20..}] at @s

#choose spread direction
summon area_effect_cloud ~1 ~ ~ {Tags:["gm4_shroomite_spore_check"],Duration:1}
summon area_effect_cloud ~-1 ~ ~ {Tags:["gm4_shroomite_spore_check"],Duration:1}
summon area_effect_cloud ~ ~ ~1 {Tags:["gm4_shroomite_spore_check"],Duration:1}
summon area_effect_cloud ~ ~ ~-1 {Tags:["gm4_shroomite_spore_check"],Duration:1}
execute as @e[type=area_effect_cloud,tag=gm4_shroomite_spore_check] at @s if block ~ ~ ~ #gm4:full_collision if block ~ ~1 ~ #gm4:full_collision run kill @s

#place mycelium and mushroom (only on 8th step)
execute if entity @s[nbt={Age:2560},scores={gm4_sporeprint=6..}] if block ~ ~-1 ~ #gm4_shroomites:spore_spreadable unless entity @e[tag=gm4_shroomite_shroom,type=area_effect_cloud,distance=..4.5] if block ~ ~ ~ #gm4_shroomites:shroom_rootable run function gm4_shroomites:shroom_spawn
execute if block ~ ~-1 ~ #gm4_shroomites:spore_spreadable run setblock ~ ~-1 ~ mycelium

#move spore sideways, then up or down if needed
teleport @s @e[sort=random,limit=1,distance=..1.1,tag=gm4_shroomite_spore_check,type=area_effect_cloud]
execute at @s if block ~ ~ ~ #gm4:full_collision run tp @s ~ ~1 ~
execute at @s unless block ~ ~-1 ~ #gm4:full_collision run tp @s ~ ~-1 ~

#increase gm4_sporeprint if reached tile beneath is already mycelium
execute at @s if block ~ ~-1 ~ mycelium run scoreboard players add @s gm4_sporeprint 1

#affect cows with shrooms
execute at @s as @e[type=cow,distance=..0.5,limit=1,sort=nearest] run function gm4_shroomites:cow_infect
execute if entity @e[type=cow,distance=..0.5,limit=1,sort=nearest] run kill @s

scoreboard players set @s gm4_shroom_time 0
