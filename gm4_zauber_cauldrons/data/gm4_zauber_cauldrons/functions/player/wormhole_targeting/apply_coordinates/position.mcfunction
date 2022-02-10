# @s = marker area effect cloud
# at location of player consuming wormhole_bottle
# run from player/wormhole_targeting/prepare_teleport

# teleport marker to stored coordinates
execute store result entity @s Pos[0] double 1 run scoreboard players get $wormhole_x gm4_zc_data
execute store result entity @s Pos[1] double 1 run scoreboard players get $wormhole_y gm4_zc_data
execute store result entity @s Pos[2] double 1 run scoreboard players get $wormhole_z gm4_zc_data

# teleport marker and player to correct dimension
# target dimension based on marker id provided by forceload library
execute as @e[type=marker,tag=gm4_dimension] if score @s gm4_dimension = $wormhole_d gm4_zc_data run tag @s add gm4_zc_targeted_dimension
execute at @e[type=marker,tag=gm4_zc_targeted_dimension,limit=1] positioned as @s run function gm4_zauber_cauldrons:player/wormhole_targeting/apply_coordinates/dimension
tag @e[type=marker,tag=gm4_dimension] remove gm4_zc_targeted_dimension

# remove "new" tag from marker
tag @s remove gm4_zc_new_wormhole_target
