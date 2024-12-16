# main loop for raycasting for the vanilla flower pot the player interacted with
# @s = player who interacted with a flower pot
# at @s anchored eyes, then marched forward 0.005 over and over
# run from flower/vanilla_pots/as_player
# run from this function...

# if current execution context in flower pot hitbox, set new temp markers data to have player UUID
execute if function gm4_blossoming_pots:flower/vanilla_pots/raycast/is_vanilla_pot run return run \
    data modify entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.temp.vanilla_flower_pot,distance=..0.1] data.UUID set from entity @s UUID

# remove range
scoreboard players remove @s gm4_blossoming_pots.range 1

# repeat until find flower pot or out of range
execute if score @s gm4_blossoming_pots.range matches 1.. positioned ^ ^ ^0.005 run function gm4_blossoming_pots:flower/vanilla_pots/raycast/loop
