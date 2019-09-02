# blast furnace processes
# @s - blast furnace that isn't pointing to a furnace
# called by process

tag @s remove gm4_bf_has_furnace
execute if block ~1 ~ ~ furnace run tp @s ~ ~ ~ -90 0
execute if block ~-1 ~ ~ furnace run tp @s ~ ~ ~ 90 0
execute if block ~ ~ ~1 furnace run tp @s ~ ~ ~ 0 0
execute if block ~ ~ ~-1 furnace run tp @s ~ ~ ~ 180 0
execute at @s if block ^ ^ ^1 furnace run tag @s add gm4_bf_has_furnace
