# @s = soul fragment with a linked player nearby
# from soul_fragment/process

#add tag for sounds/particles
scoreboard players set @s gm4_sf_fire 1

# fix F3+B visual bug (remove before publishing, most likely)
data merge entity @s {Air:1s}
data merge entity @s {Air:0s}

# prepare for absorbtion or capture when on target
execute if entity @a[tag=gm4_sf_target,distance=..1.5,limit=1] run tag @s add gm4_sf_absorb

# capture or absorb fragment
execute as @a[tag=gm4_sf_target,distance=..1.5,limit=1] at @s run function gm4_soul_fragments:player/intake_fragment

# move towards target player
tp @s ^ ^.14 ^0.5 facing entity @a[tag=gm4_sf_target,limit=1,sort=nearest,distance=..16] feet

tag @s remove gm4_sf_absorb
