# Main loop for raycasting for the flower pot the player interacted with
# @s = player who interacted with a flower pot
# at @s anchored eyes, then marched forward 0.005 over and over
# run from flower/as_player and self

# if current location is within the flower pots hit box, summon a temp marker, set its data with the player rotation, and exit raycast
execute if block ~ ~ ~ minecraft:flower_pot \
    summon minecraft:marker if function gm4_blossoming_pots:flower/in_flower_pot \
    at @s align xyz positioned ~.5 ~.5 ~.5 \
    run return run function gm4_blossoming_pots:flower/prepare_data with storage gm4_blossoming_pots:flower_pots temp

# remove range
scoreboard players remove @s gm4_blossoming_pots.range 1

# repeat until find flower pot or out of range
execute if score @s gm4_blossoming_pots.range matches 1.. positioned ^ ^ ^0.005 run function gm4_blossoming_pots:flower/raycast
