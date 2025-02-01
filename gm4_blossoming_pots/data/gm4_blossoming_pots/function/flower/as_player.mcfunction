# Raycasts for pot the player interacted with, then proceeds if necessary
# @s = player who interacted with an empty flower pot
# at @s
# run from advancement gm4_blossoming_pots:interact_with_flower_pot

# Reset advancement
advancement revoke @s only gm4_blossoming_pots:interact_with_flower_pot

function gm4_blossoming_pots:flower/get_player_data
# raycast
execute store result score @s gm4_blossoming_pots.range run attribute @s minecraft:block_interaction_range get 200
execute anchored eyes run function gm4_blossoming_pots:flower/raycast
