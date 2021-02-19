# @s = soul fragment with a linked player nearby
# from soul_fragment/target

#add tag for sounds/particles
scoreboard players set @s gm4_sf_fire 1

# fix F3+B visual bug (remove before publishing, most likely)
data merge entity @s {Air:1s}
data merge entity @s {Air:0s}

# stop previous hums and prepare for absorbtion or capture when on target (but not fake target)
execute if entity @e[type=#gm4_soul_fragments:interact,tag=gm4_sf_target,tag=!gm4_sf_f_target,distance=..1.5,limit=1] run stopsound @a[distance=..22] neutral minecraft:block.beacon.ambient
execute if entity @e[type=#gm4_soul_fragments:interact,tag=gm4_sf_target,tag=!gm4_sf_f_target,distance=..1.5,limit=1] run tag @s add gm4_sf_absorb

# capture or absorb fragment
execute as @e[type=#gm4_soul_fragments:interact,tag=gm4_sf_target,tag=!gm4_sf_f_target,distance=..1.5,limit=1] at @s run function gm4_soul_fragments:intake_fragment

# move towards target player or totem of undying
tp @s ^ ^.14 ^0.5 facing entity @e[type=#gm4_soul_fragments:interact,tag=gm4_sf_target,limit=1,sort=nearest,distance=..16] feet

tag @s remove gm4_sf_absorb
