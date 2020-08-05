# smeltery processes
# @s - smeltery that isn't pointing to a furnace
# called by process

tag @s remove gm4_bf_has_furnace
execute if block ~1 ~ ~ furnace[facing=east] run tp @s ~ ~ ~ -90 0
execute if block ~-1 ~ ~ furnace[facing=west] run tp @s ~ ~ ~ 90 0
execute if block ~ ~ ~1 furnace[facing=south] run tp @s ~ ~ ~ 0 0
execute if block ~ ~ ~-1 furnace[facing=north] run tp @s ~ ~ ~ 180 0
execute at @s if block ^ ^ ^1 furnace run tag @s add gm4_bf_has_furnace
execute at @s unless block ^ ^ ^1 furnace run tp @s ~ ~ ~ 45 0
