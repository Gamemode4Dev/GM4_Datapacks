#@s = player who reeled in armor stand
#run from durability/set_mainhand and durability/set_offhand

scoreboard players operation seed gm4_ef_data *= mult gm4_ef_data
scoreboard players operation seed gm4_ef_data += incr gm4_ef_data
scoreboard players operation result gm4_ef_data = seed gm4_ef_data
scoreboard players operation result gm4_ef_data /= #100 gm4_ef_data
scoreboard players operation result gm4_ef_data %= #100 gm4_ef_data

scoreboard players add unbreaking gm4_ef_data 1
scoreboard players operation unbreaking_chance gm4_ef_data = #100 gm4_ef_data
scoreboard players operation unbreaking_chance gm4_ef_data /= unbreaking gm4_ef_data
execute if score result gm4_ef_data < unbreaking_chance gm4_ef_data run scoreboard players add damage gm4_ef_data 1
execute if score result gm4_ef_data < unbreaking_chance gm4_ef_data if entity @s[tag=gm4_ef_looted] run scoreboard players add damage gm4_ef_data 1
