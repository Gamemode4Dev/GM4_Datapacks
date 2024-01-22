# selects how to check the players's held item depending on their gamemode
# @s = player who has interacted with a zauber cauldron
# at position of cauldron, align xyz
# run from cauldron/liquid/update/level_3/reconstruct_interaction

# the player can not have been in spectator, so checking for !creative is the same as checking for survival or adventure
execute if entity @s[gamemode=!creative] store result score $item_use_code gm4_zc_data run function gm4_zauber_cauldrons:cauldron/liquid/update/level_3/analyze_held_items/survival_or_adventure
execute if entity @s[gamemode=creative] store result score $item_use_code gm4_zc_data run function gm4_zauber_cauldrons:cauldron/liquid/update/level_3/analyze_held_items/creative
