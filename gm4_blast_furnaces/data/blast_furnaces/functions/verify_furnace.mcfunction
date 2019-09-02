# check furnace and store cooktime
# called by processes

scoreboard players set @s gm4_bf_data -1
execute if entity @s[y_rotation=0] if block ~ ~ ~1 furnace[facing=south] store result score @s gm4_bf_data run data get block ~ ~ ~1 CookTime
execute if entity @s[y_rotation=90] if block ~-1 ~ ~ furnace[facing=west] store result score @s gm4_bf_data run data get block ~-1 ~ ~ CookTime
execute if entity @s[y_rotation=180] if block ~ ~ ~-1 furnace[facing=north] store result score @s gm4_bf_data run data get block ~ ~ ~-1 CookTime
execute if entity @s[y_rotation=-90] if block ~1 ~ ~ furnace[facing=east] store result score @s gm4_bf_data run data get block ~1 ~ ~ CookTime

# display ore
execute if score @s gm4_bf_data matches 0.. run function blast_furnaces:check_ore
