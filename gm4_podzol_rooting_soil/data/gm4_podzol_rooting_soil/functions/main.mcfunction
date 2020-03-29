# function loops on a 30-second (600t or 0.5Hz) cycle
schedule function gm4_podzol_rooting_soil:main 600t

# query random tick speed
execute store result score random_tick_speed gm4_podzol_data run gamerule randomTickSpeed

# prepare lööp
scoreboard players add last_uuid gm4_podzol_data 11
scoreboard players operation last_uuid gm4_podzol_data %= #200 gm4_podzol_data

# get sapling items
execute as @e[type=item] run function gm4_podzol_rooting_soil:process_saplings

#target first sapling entity
#get uuid and store into score -> mod 100
#copy into temp score multiply by random_tick_speed -> mod 100

#compare temp score to last uuid, if larger, grow
#target next sapling
