# @s = player or totem approached by a soul fragment or regenerating health
# from soul_fragment/seek_target or player/manage_regen

tag @s remove gm4_sf_target

execute if entity @s[type=player] run function gm4_soul_fragments:player/regen_health
execute if entity @s[type=item,nbt={OnGround:1b}] run function gm4_soul_fragments:totem/capture_fragment

# visuals

playsound minecraft:block.bell.resonate neutral @a[distance=..16] ~ ~.2 ~ .8 2
particle minecraft:soul ~ ~.2 ~ .22 0 .22 .025 6 normal

kill @e[type=minecraft:area_effect_cloud,tag=gm4_sf_absorb,distance=..1.7,limit=1]
