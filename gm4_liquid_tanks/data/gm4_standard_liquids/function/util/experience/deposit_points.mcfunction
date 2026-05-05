#@s = player above experience tank at center of tank
#run from standard_liquids:tick

#dumps 5 (or 1) points of experience from player into tank
execute store result score $available_points gm4_lt_util run experience query @s points
execute if score $available_points gm4_lt_util matches 0 if entity @s[level=1..] run scoreboard players set $available_points gm4_lt_util 5

execute if score $available_points gm4_lt_util matches 4.. if score @e[type=marker,tag=gm4_liquid_tank,limit=1,distance=..0.5] gm4_lt_value matches ..5340 run experience add @s -4 points
execute if score $available_points gm4_lt_util matches 4.. if score @e[type=marker,tag=gm4_liquid_tank,limit=1,distance=..0.5] gm4_lt_value matches ..5340 run scoreboard players add @e[type=marker,tag=gm4_liquid_tank,limit=1,distance=..0.5] gm4_lt_value 4

execute if score $available_points gm4_lt_util matches 1.. run experience add @s -1 points
execute if score $available_points gm4_lt_util matches 1.. run scoreboard players add @e[type=marker,tag=gm4_liquid_tank,limit=1,distance=..0.5] gm4_lt_value 1

function #gm4_liquid_tanks:level_report_check

execute as @e[type=marker,tag=gm4_liquid_tank,limit=1,distance=..0.5] unless score @s gm4_lt_prior_val = @s gm4_lt_value run function gm4_liquid_tanks:liquid_value_update
