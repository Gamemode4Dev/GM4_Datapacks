# @s = player to check for wormhole bottles
# at world spawn

# store coordinates of mainhand and/or offhand if applicable
execute if predicate gm4_zauber_cauldrons:check_wormhole_bottle_mainhand run function gm4_zauber_cauldrons:recipes/chorus/store_mainhand_coordinates
execute unless score stored_coordinates gm4_zc_data matches 1 if predicate gm4_zauber_cauldrons:check_wormhole_bottle_offhand run function gm4_zauber_cauldrons:recipes/chorus/store_offhand_coordinates

# reset fake player
scoreboard players reset stored_coordinates gm4_zc_data
