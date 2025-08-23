#@s = liquid tank, positioned at furnace
#run from standard_liquids:util/furnace_fueling/lava_tank

execute if score @s gm4_lt_util matches 1.. run item replace block ~ ~ ~ container.1 with wooden_hoe[damage=59,custom_name="Bug",custom_data={tankhoe:1b}] 1
execute if score @s gm4_lt_util matches 1.. run data merge block ~ ~ ~ {cooking_time_spent:0}
execute if score @s gm4_lt_util matches 1.. run tag @s add gm4_lt_furnace_start
execute if score @s gm4_lt_util matches 1.. run scoreboard players remove @s gm4_lt_util 1

#schedule furnace fueling one tick later; when furnace processes hoe and ignites
schedule function gm4_standard_liquids:util/furnace_fueling/scheduled_furnace_fuel 1t
