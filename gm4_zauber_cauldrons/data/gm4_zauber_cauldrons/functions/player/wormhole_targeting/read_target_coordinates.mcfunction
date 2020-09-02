# @s = player to check for wormhole bottles
# at world spawn
# run from player/wormhole_targeting/prepare_teleport

# read coordinates of mainhand and/or offhand if applicable
execute if predicate gm4_zauber_cauldrons:player/equipment/wormhole/in_mainhand run function gm4_zauber_cauldrons:player/wormhole_targeting/read_mainhand_coordinates
execute unless score read_coordinates gm4_zc_data matches 1 if predicate gm4_zauber_cauldrons:player/equipment/wormhole/in_offhand run function gm4_zauber_cauldrons:player/wormhole_targeting/read_offhand_coordinates

# reset fake player
scoreboard players reset read_coordinates gm4_zc_data
