# Sets up raycast, then redirects to as_marker, then revokes advancement
# @s = player who interacted with a decorated pot
# at @s
# run from advancement gm4_blossoming_pots:item_in_pot

# Raycast for the pot (set up range and search)
execute store result score @s gm4_blossoming_pots.range run attribute @s minecraft:player.block_interaction_range get 1
scoreboard players operation @s gm4_blossoming_pots.range *= $raycast_multiplier gm4_blossoming_pots.range
execute anchored eyes run function gm4_blossoming_pots:decorated/raycast/loop

execute as @e[type=minecraft:marker,sort=nearest,tag=gm4_blossoming_pots.temp.decorated_pot] at @s \
    align xyz positioned ~.5 ~.5 ~.5 run function gm4_blossoming_pots:decorated/as_marker with block ~ ~ ~ item

# Reset advancement
advancement revoke @s only gm4_blossoming_pots:item_in_pot
