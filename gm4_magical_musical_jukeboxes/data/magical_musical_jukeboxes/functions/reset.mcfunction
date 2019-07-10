# @s = magical musical jukebox armor stand positioned ~ ~1 ~
# run from process

tag @s remove gm4_mmj_has_disc
execute positioned ~ ~-0.7 ~ run kill @e[type=area_effect_cloud,distance=..0.1,tag=gm4_mmj_effects]
