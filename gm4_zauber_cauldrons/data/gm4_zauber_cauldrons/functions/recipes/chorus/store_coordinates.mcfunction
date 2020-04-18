# @s = player to check for wormhole bottles
# at world spawn

#store coordinates of mainhand and/or offhand if applicable
execute if predicate gm4_zauber_cauldrons:check_wormhole_bottle_mainhand run function gm4_zauber_cauldrons:recipes/chorus/store_mainhand_coordinates
execute if predicate gm4_zauber_cauldrons:check_wormhole_bottle_offhand run function gm4_zauber_cauldrons:recipes/chorus/store_offhand_coordinates
