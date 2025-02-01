# Prevent a player putting an item from potable_pots tag list into a pot that already has a blossoming pots block display
# @s = player who interacted with a filled vanilla flower pot
# at @s
# run from advancement gm4_blossoming_pots:interact_with_vanilla_flower_pot

# Reset advancement
advancement revoke @s only gm4_blossoming_pots:interact_with_vanilla_flower_pot

# Store player data for later, if raycast succeeds.
data modify storage gm4_blossoming_pots:flower_pots temp.UUID set from entity @s UUID

# Raycast for the pot (set up range and search) and proceed if needed
execute store result score @s gm4_blossoming_pots.range run attribute @s minecraft:block_interaction_range get 200
execute anchored eyes run function gm4_blossoming_pots:vanilla_pot_handling/raycast
