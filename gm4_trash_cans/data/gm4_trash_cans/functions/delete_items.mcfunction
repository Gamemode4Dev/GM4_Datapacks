# @s = trash_can that has items in it and has not been disabled
# run from check_rate

execute store result score @s gm4_trash_amount run data get block ~ ~ ~ Items.[0].Count
scoreboard players operation @s gm4_trash_amount -= @s gm4_trash_rate
execute store result block ~ ~ ~ Items.[0].Count byte 1 run scoreboard players get @s gm4_trash_amount