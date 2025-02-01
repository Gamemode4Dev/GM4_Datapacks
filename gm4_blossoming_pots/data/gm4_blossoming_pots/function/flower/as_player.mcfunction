# Sets up raycast, then redirects to as_marker, then revokes advancement
# @s = player who interacted with an empty flower pot
# at @s
# run from advancement gm4_blossoming_pots:interact_flower_pot

# Reset advancement
advancement revoke @s only gm4_blossoming_pots:interact_with_flower_pot

# Raycast for the pot (set up range and search)
execute store result score @s gm4_blossoming_pots.range run attribute @s minecraft:block_interaction_range get 200
execute anchored eyes run function gm4_blossoming_pots:flower/raycast/loop

# HERE ????????
execute as @n[type=minecraft:marker,tag=gm4_blossoming_pots.temp.flower_pot,distance=32] at @s \
    align xyz positioned ~.5 ~.5 ~.5 run function gm4_blossoming_pots:flower/as_marker with storage gm4_blossoming_pots:flower_pots temp
