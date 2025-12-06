# function loops on a 20-second (400t or 0.05Hz) cycle
schedule function gm4_podzol_rooting_soil:main 400t

# query random tick speed
execute store result score random_tick_speed gm4_podzol_data run gamerule random_tick_speed

# prepare lööp
scoreboard players add last_uuid gm4_podzol_data 11
scoreboard players operation last_uuid gm4_podzol_data %= #200 gm4_podzol_data

# get sapling items
execute as @e[type=item,predicate=gm4_podzol_rooting_soil:plantable_on_ground] at @s run function gm4_podzol_rooting_soil:process_item
