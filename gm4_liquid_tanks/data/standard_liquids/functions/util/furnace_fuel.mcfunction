#@s = liquid tank, positioned at furnace
#run from standard_liquids:util_above

#remove hoe if not furnace not started
execute if block ~ ~ ~ furnace[lit=false]{Items:[{Slot:1b,tag:{tankhoe:1b}}]} run replaceitem block ~ ~ ~ container.1 air

#adjust burntime and remove lava
execute store success score lava_fueling gm4_lt_util if block ~ ~ ~ furnace[lit=true]{CookTime:1s,BurnTime:200s} run data merge block ~ ~ ~ {BurnTime:6600s}
execute if score lava_fueling gm4_lt_util matches 1.. run scoreboard players remove @s gm4_lt_buffer 1
scoreboard players reset lava_fueling gm4_lt_util

execute unless score @s gm4_lt_buffer matches 0 run function liquid_tanks:liquid_value_update
