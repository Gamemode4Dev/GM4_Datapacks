# raycast particles from this flowering coral vine to coral flower
# @s = flowering coral vine
# at @s, facing and raycasting to nearest coral flower
# run from coral_vine/flower/discharge
# run from here

scoreboard players remove $raycast_limit gm4_hy_data 1

particle bubble_column_up ~ ~ ~ 0.05 0.05 0.05 0 1
particle bubble ~ ~ ~ 0.1 0.1 0.1 0 2

execute if entity @e[type=item_display,tag=gm4_hy_coral_core,distance=..0.2] run scoreboard players set $raycast_limit gm4_hy_data 0
execute if score $raycast_limit gm4_hy_data matches 1.. positioned ^ ^ ^0.1 run function gm4_hydromancy:coral_vine/flower/raycast
