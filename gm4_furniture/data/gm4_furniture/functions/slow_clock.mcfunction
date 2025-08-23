schedule function gm4_furniture:slow_clock 10s

# check seats to see if they are empty
execute as @e[type=item_display,tag=gm4_furniture.seat] run function gm4_furniture:interact/sit/check

# process furniture stations
execute as @e[type=villager,tag=gm4_furniture.furniture_station] at @s run function gm4_furniture:technical/furniture_station/activation/process

# TEMP: update wandering trader
execute as @e[type=wandering_trader,tag=gm4_furniture.furniture_station] at @s run function gm4_furniture:update/update_villager
# TEMP: update sittable furniture
execute as @e[type=interaction,tag=gm4_furniture.sittable] run function gm4_furniture:update/update_seat
