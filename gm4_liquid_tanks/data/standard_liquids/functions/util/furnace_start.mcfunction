#@s = liquid tank, positioned at furnace
#run from standard_liquids:util_above

execute if score @s gm4_lt_util matches 1.. run replaceitem block ~ ~ ~ container.1 wooden_hoe{Damage:59s,display:{Name:"\"Bug\""},tankhoe:1b} 1
execute if score @s gm4_lt_util matches 1.. run data merge block ~ ~ ~ {CookTime:0}
execute if score @s gm4_lt_util matches 1.. run tag @s add gm4_lt_furnace_start
execute if score @s gm4_lt_util matches 1.. run scoreboard players remove @s gm4_lt_util 1

scoreboard players set standard_liquids_furnace_start gm4_lt_util 1
