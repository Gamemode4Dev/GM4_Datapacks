# @s = soul fragment with a linked player nearby
# from soul_fragment/sustain

# move towards linked player
tp @s ^ ^.13 ^0.5 facing entity @p[tag=gm4_sf_target,distance=..16] feet

# emit particles near linked player
particle minecraft:soul ~ ~ ~ .05 0 .05 .015 1 force

# hum when near linked player
playsound minecraft:block.beacon.ambient neutral @a[distance=..16] ~ ~ ~ .6 .4 .6

# stop hum and prepare for absorbtion when on linked player
execute if entity @a[tag=gm4_sf_target,distance=..1.55,limit=1] run stopsound @a[distance=..16] neutral minecraft:block.beacon.ambient
execute if entity @a[tag=gm4_sf_target,distance=..1.55,limit=1] run tag @s add gm4_sf_absorb
execute as @a[tag=gm4_sf_target,distance=..1.55,limit=1] run function gm4_soul_fragments:player/absorb_fragment
