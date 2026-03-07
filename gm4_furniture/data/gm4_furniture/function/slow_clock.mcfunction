schedule function gm4_furniture:slow_clock 10s

# check seats to see if they are empty
execute as @e[type=item_display,tag=gm4_furniture.seat] run function gm4_furniture:interact/sit/check

# process furniture stations
execute as @e[type=villager,tag=gm4_furniture.furniture_station,tag=!gm4_furniture.tp_down] at @s run function gm4_furniture:technical/furniture_station/activation/process
