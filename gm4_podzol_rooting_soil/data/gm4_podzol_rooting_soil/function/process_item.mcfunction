# @s = sapling item
# at world spawn
# called from gm4_podzol_rooting_soil:main

# get own uuid into scoreboard and scale into range
execute store result score current_uuid gm4_podzol_data run data get entity @s UUID[0]
scoreboard players operation current_uuid gm4_podzol_data %= #100 gm4_podzol_data

# copy into target and shift by random_tick_speed
scoreboard players operation compared_value gm4_podzol_data = current_uuid gm4_podzol_data
scoreboard players operation compared_value gm4_podzol_data *= random_tick_speed gm4_podzol_data

# compare
execute if score compared_value gm4_podzol_data >= last_uuid gm4_podzol_data at @s if block ~ ~-1 ~ minecraft:podzol if block ~ ~ ~ #gm4_podzol_rooting_soil:sapling_replaceable run function gm4_podzol_rooting_soil:plant

# force plant if about to despawn and if the previous randomizer test failed
execute store result score age gm4_podzol_data run data get entity @s Age
execute unless score compared_value gm4_podzol_data >= last_uuid gm4_podzol_data if score age gm4_podzol_data matches 5399.. at @s if block ~ ~-1 ~ minecraft:podzol if block ~ ~ ~ #gm4_podzol_rooting_soil:sapling_replaceable run function gm4_podzol_rooting_soil:plant

# clean up
scoreboard players operation last_uuid gm4_podzol_data += current_uuid gm4_podzol_data
scoreboard players operation last_uuid gm4_podzol_data %= #200 gm4_podzol_data
scoreboard players reset compared_value gm4_podzol_data
scoreboard players reset current_uuid gm4_podzol_data
scoreboard players reset age gm4_podzol_data
