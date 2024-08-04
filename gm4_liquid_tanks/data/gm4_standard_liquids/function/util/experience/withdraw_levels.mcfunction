#@s = player below experience tank at center of tank
#run from standard_liquids:util/experience/scheduled_withdraw

execute unless score @s gm4_lt_util matches 0.. run scoreboard players set @s gm4_lt_util 16

scoreboard players remove @s gm4_lt_util 1

execute if score @s gm4_lt_util matches ..0 run function gm4_standard_liquids:util/experience/withdraw_one_level
