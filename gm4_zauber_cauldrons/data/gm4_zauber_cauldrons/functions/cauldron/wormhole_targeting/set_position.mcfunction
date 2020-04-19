# @s = marker area effect cloud
# at location of player consuming wormhole_bottle
# run from cauldron/wormhole_targeting/choose_dimension

# teleport marker to stored coordinates
execute store result entity @s Pos[0] double 1 run scoreboard players get wormhole_x gm4_zc_data
execute store result entity @s Pos[1] double 1 run scoreboard players get wormhole_y gm4_zc_data
execute store result entity @s Pos[2] double 1 run scoreboard players get wormhole_z gm4_zc_data

# teleport marker and player to correct dimension
execute if score wormhole_d gm4_zc_data matches 0 positioned as @s in overworld run function gm4_zauber_cauldrons:cauldron/wormhole_targeting/set_dimension
execute if score wormhole_d gm4_zc_data matches 1 positioned as @s in the_end run function gm4_zauber_cauldrons:cauldron/wormhole_targeting/set_dimension
execute if score wormhole_d gm4_zc_data matches -1 positioned as @s in the_nether run function gm4_zauber_cauldrons:cauldron/wormhole_targeting/set_dimension

# remove "new" tag from marker
tag @s remove gm4_zc_new_wormhole_target
