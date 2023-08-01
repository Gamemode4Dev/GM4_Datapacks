# play bubble particles at opened chest
# @s = player that opened the chest
# at @s, raycasted forward to chest
# run from additions/water_chest/raycast

# stop raycast
scoreboard players set $raycast_limit gm4_hy_data 0

# bubbles
execute align xyz run particle bubble_column_up ~.5 ~1.075 ~.5 0.1 0.05 0.1 0.15 18
