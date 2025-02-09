# Main loop for raycasting for the vanilla flower pot the player interacted with
# @s = player who interacted with a flower pot
# at @s anchored eyes, then marched forward 0.005 over and over
# run from vanilla_pot_handling/as_player and self

# if block is a vanilla flower pot and execution context is in the flower pot, proceed to as_marker
execute if block ~ ~ ~ #gm4_blossoming_pots:potted_plants \
    summon minecraft:marker if function gm4_blossoming_pots:vanilla_pot_handling/in_vanilla_flower_pot \
    at @s align xyz positioned ~.5 ~.5 ~.5 \
    run return run function gm4_blossoming_pots:vanilla_pot_handling/as_marker
    

# remove range
scoreboard players remove @s gm4_blossoming_pots.range 1

# repeat until find flower pot or out of range
execute if score @s gm4_blossoming_pots.range matches 1.. positioned ^ ^ ^0.005 run function gm4_blossoming_pots:vanilla_pot_handling/raycast
