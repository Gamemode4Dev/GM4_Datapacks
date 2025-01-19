# Sets up raycast, then redirects to as_marker, then revokes advancement
# @s = player who interacted with a decorated pot
# at @s
# run from advancement gm4_blossoming_pots:item_in_pot

# Reset advancement
advancement revoke @s only gm4_blossoming_pots:item_in_pot

# Raycast for the pot (set up range and search)
execute store result score @s gm4_blossoming_pots.range run attribute @s minecraft:block_interaction_range get 200
execute anchored eyes run function gm4_blossoming_pots:decorated/raycast/loop

execute as @n[type=minecraft:marker,tag=gm4_blossoming_pots.temp.decorated_pot] at @s \
    align xyz positioned ~.5 ~.5 ~.5 run function gm4_blossoming_pots:decorated/as_marker with block ~ ~ ~ item

# kill temp markers that failed to instantiate function (pot empty)
kill @e[type=minecraft:marker,tag=gm4_blossoming_pots.temp.decorated_pot]
