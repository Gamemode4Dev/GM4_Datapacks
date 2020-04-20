# @s = player to check for wormhole bottles
# at world spawn
# run from player_checks/normal

# store coordinates of mainhand and/or offhand if applicable
execute if predicate gm4_zauber_cauldrons:player/equipment/wormhole/in_mainhand run function gm4_zauber_cauldrons:recipes/chorus/store_mainhand_coordinates
execute unless score stored_coordinates gm4_zc_data matches 1 if predicate gm4_zauber_cauldrons:player/equipment/wormhole/in_offhand run function gm4_zauber_cauldrons:recipes/chorus/store_offhand_coordinates

# reset fake player
scoreboard players reset stored_coordinates gm4_zc_data
