# @s = player who reeled in armor stand
# run from durability/set_mainhand and durability/set_offhand

# calculate durability
scoreboard players set $durability gm4_ef_data 64
scoreboard players operation $durability gm4_ef_data -= @s gm4_ef_data
scoreboard players operation $durability gm4_ef_data *= #10000 gm4_ef_data
scoreboard players operation $durability gm4_ef_data /= #64 gm4_ef_data

# calculate unbreaking
scoreboard players add $unbreaking_lvl gm4_ef_data 1
scoreboard players operation $unbreaking gm4_ef_data = #100 gm4_ef_data
scoreboard players operation $unbreaking gm4_ef_data /= $unbreaking_lvl gm4_ef_data
