# Sets up raycast, then redirects to as_marker, then revokes advancement
# @s = player who interacted with a filled vanilla flower pot
# at @s
# run from advancement gm4_blossoming_pots:interact_vanilla_flower_pot

# Raycast for the pot (set up range and search)
    # range is 6 blocks, don't know how to handle custom block interaction range...
scoreboard players set @s gm4_blossoming_pots.range 1200
execute anchored eyes run function gm4_blossoming_pots:flower/vanilla_pots/raycast/loop

execute as @e[type=minecraft:marker,sort=nearest,tag=gm4_blossoming_pots.temp.vanilla_flower_pot] at @s align xyz positioned ~.5 ~.5 ~.5 run function gm4_blossoming_pots:flower/vanilla_pots/as_marker

# Reset advancement
advancement revoke @s only gm4_blossoming_pots:interact_vanilla_flower_pot
