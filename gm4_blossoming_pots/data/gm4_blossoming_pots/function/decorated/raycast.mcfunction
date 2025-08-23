# Main loop for raycasting for the decorated pot the player interacted with
# @s = player who interacted with a decorated pot
# at @s anchored eyes, then marched forward 0.005 over and over
# run from decorated/as_player and self

# if current location is within the decorated pots hit box, summon a temp marker, set its data with the player rotation, and exit raycast
execute if block ~ ~ ~ minecraft:decorated_pot \
    summon minecraft:marker if function gm4_blossoming_pots:decorated/in_decorated_pot \
    at @s align xyz positioned ~.5 ~.5 ~.5 \
    run return run function gm4_blossoming_pots:decorated/check_if_pot_empty

scoreboard players remove @s gm4_blossoming_pots.range 1

# repeat until find decorated pot or out of range
execute if score @s gm4_blossoming_pots.range matches 1.. positioned ^ ^ ^0.005 run function gm4_blossoming_pots:decorated/raycast
