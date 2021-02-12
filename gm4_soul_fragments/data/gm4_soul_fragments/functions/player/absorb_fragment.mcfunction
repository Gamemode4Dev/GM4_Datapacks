# @s = player approached by their soul fragment
# from soul_fragment/seek_player

function gm4_soul_fragments:player/regen_health

tag @s remove gm4_sf_target

kill @e[type=minecraft:area_effect_cloud,tag=gm4_sf_absorb,distance=..1.55,limit=1]
