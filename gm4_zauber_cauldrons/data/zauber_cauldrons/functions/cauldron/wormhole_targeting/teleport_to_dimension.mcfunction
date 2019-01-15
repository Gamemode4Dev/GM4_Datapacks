# @s player consuming wormhole_bottle
# at @s in depending on call
# run from cauldron/wormhole_targeting/choose_dimension

#warp marker to the chosen dimension
tp @e[type=area_effect_cloud,tag=gm4_zc_wormhole_target,tag=gm4_zc_new_wormhole_target,limit=1] ~ ~ ~

#teleport marker
execute store result entity @e[type=area_effect_cloud,tag=gm4_zc_wormhole_target,tag=gm4_zc_new_wormhole_target,limit=1] Pos.[0] double 1 run scoreboard players get @s gm4_zc_warp_x
execute store result entity @e[type=area_effect_cloud,tag=gm4_zc_wormhole_target,tag=gm4_zc_new_wormhole_target,limit=1] Pos.[1] double 1 run scoreboard players get @s gm4_zc_warp_y
execute store result entity @e[type=area_effect_cloud,tag=gm4_zc_wormhole_target,tag=gm4_zc_new_wormhole_target,limit=1] Pos.[2] double 1 run scoreboard players get @s gm4_zc_warp_z

#teleport player
execute at @e[type=area_effect_cloud,tag=gm4_zc_wormhole_target,tag=gm4_zc_new_wormhole_target,limit=1] run tp @s ~.5 ~.7 ~.5
execute at @s run function zauber_cauldrons:cauldron/wormhole_targeting/arrival_animation
#check for cauldron at destination


tag @e[type=area_effect_cloud,tag=gm4_zc_wormhole_target] remove gm4_zc_new_wormhole_target
