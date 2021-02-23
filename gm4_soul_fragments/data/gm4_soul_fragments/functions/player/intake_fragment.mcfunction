# @s = player or lantern approached by their soul fragment or regenerating health
# from soul_fragment/seek_target

tag @s remove gm4_sf_target

execute if entity @s[tag=gm4_sf_linked] run function gm4_soul_fragments:player/regen_health
execute if entity @s[tag=!gm4_sf_linked] run function gm4_soul_fragments:player/capture_fragment

tag @s remove gm4_sf_linked

# visuals/sounds

playsound minecraft:block.bell.resonate neutral @a[distance=..16] ~ ~.2 ~ .8 2
particle minecraft:soul ~ ~.2 ~ .22 0 .22 .025 6 normal

kill @e[type=minecraft:area_effect_cloud,tag=gm4_sf_absorb,distance=..1.7,limit=1]

# schedule function to remove hum sounds
tag @s add gm4_stop_sound
schedule function gm4_soul_fragments:player/kill_sound 1t
