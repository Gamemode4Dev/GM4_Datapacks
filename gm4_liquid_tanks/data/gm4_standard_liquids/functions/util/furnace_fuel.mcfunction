#@s = liquid tank, positioned at furnace
#scheduled run from standard_liquids:util/furnace_start

#remove hoe if not furnace not started
execute if block ~ ~ ~ furnace[lit=false]{Items:[{Slot:1b,tag:{tankhoe:1b}}]} run replaceitem block ~ ~ ~ container.1 air

#adjust burntime and remove lava
scoreboard players operation @s gm4_lt_prior_val = @s gm4_lt_value
execute store success score lava_fueling gm4_lt_util if block ~ ~ ~ furnace[lit=true]{CookTime:1s,BurnTime:200s} run data merge block ~ ~ ~ {BurnTime:6600s}
execute if score lava_fueling gm4_lt_util matches 1.. run scoreboard players remove @s gm4_lt_value 1
scoreboard players reset lava_fueling gm4_lt_util

tag @s remove gm4_lt_furnace_start

execute unless score @s gm4_lt_prior_val = @s gm4_lt_value run function gm4_liquid_tanks:liquid_value_update
