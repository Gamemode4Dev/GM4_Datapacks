#@s = soul fragment with a linked player nearby (@e[type=minecraft:area_effect_cloud,tag=gm4_soul_fragment,distance=..16])
#from player/search_fragment

#emit particles near linked player
particle minecraft:soul ~ ~ ~ .05 0 .05 .015 1 force

#hum when near linked player
playsound minecraft:block.beacon.ambient master @a[distance=..22] ~ ~ ~ .6 .4

#stop hum and prepare for absorbtion when on linked player
execute if entity @a[tag=gm4_sf_target,distance=..1.55,limit=1] run stopsound @a[distance=..22] master minecraft:block.beacon.ambient
execute if entity @a[tag=gm4_sf_target,distance=..1.55,limit=1] run tag @s add gm4_sf_absorb
execute as @a[tag=gm4_sf_target,distance=..1.55,limit=1] run function gm4_soul_fragments:player/absorb_fragment

#move towards linked player
tp @s ^ ^.13 ^0.5 facing entity @p[tag=gm4_sf_target,distance=..16] feet
