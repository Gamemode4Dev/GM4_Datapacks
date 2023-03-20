# raycast particles from this flowering coral vine to coral flower
# @s = flowering coral vine
# at @s, facing and raycasting to nearest coral flower
# run from coral_vine/flower/discharge
# run from here

scoreboard players remove $raycast_limit gm4_hy_data 1
particle happy_villager ^0.2 ^ ^ 0 0 0 0 1
tp @s ^ ^ ^0.1 ~36 ~
execute if entity @e[type=item_display,tag=gm4_hy_coral_core,distance=..1] run scoreboard players set $raycast_limit gm4_hy_data 0
execute if score $raycast_limit gm4_hy_data matches 0 run kill @s
execute if score $raycast_limit gm4_hy_data matches 1.. at @s run function gm4_hydromancy:coral_vine/flower/raycast
