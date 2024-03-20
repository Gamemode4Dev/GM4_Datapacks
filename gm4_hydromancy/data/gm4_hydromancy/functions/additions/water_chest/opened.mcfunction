# show bubbles coming out of a chest underwater
# @s = player opening the chest
# at @s
advancement revoke @s only gm4_hydromancy:open_water_chest

scoreboard players set $raycast_limit gm4_hy_data 12
execute anchored eyes positioned ^ ^ ^0.5 run function gm4_hydromancy:additions/water_chest/raycast
