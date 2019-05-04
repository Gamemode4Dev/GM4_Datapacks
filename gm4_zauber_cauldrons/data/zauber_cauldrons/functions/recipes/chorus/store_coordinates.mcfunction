# @s = player to check for wormhole bottles
# at world spawn

#determine whether wormhole bottle is in mainhand and/or offhand
execute at @s store result score store_mainhand gm4_zc_data run loot spawn ~ -1024 ~ fish zauber_cauldrons:check_wormhole_bottle ~ 0 ~ mainhand
execute at @s store result score store_offhand gm4_zc_data run loot spawn ~ -1024 ~ fish zauber_cauldrons:check_wormhole_bottle ~ 0 ~ offhand

#store coordinates of mainhand and/or offhand if applicable
execute if score store_mainhand gm4_zc_data matches 1 run function zauber_cauldrons:recipes/chorus/store_mainhand_coordinates
execute if score store_offhand gm4_zc_data matches 1 run function zauber_cauldrons:recipes/chorus/store_offhand_coordinates