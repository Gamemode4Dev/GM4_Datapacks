#@s = player above experience tank at center of tank
#run from standard_liquids:util/experience/deposit_levels

# calculate points to remove one level
execute store result score $points gm4_lt_util run experience query @s points
execute store result score $levels gm4_lt_util run experience query @s levels

scoreboard players set #2 gm4_lt_util 2
scoreboard players set #5 gm4_lt_util 5
scoreboard players set #9 gm4_lt_util 9

scoreboard players operation $level_calc gm4_lt_util = $levels gm4_lt_util
execute unless score $levels gm4_lt_util matches 0 run scoreboard players remove $level_calc gm4_lt_util 1
execute if score $points gm4_lt_util matches 1.. run scoreboard players operation $level_calc gm4_lt_util = $points gm4_lt_util
execute if score $points gm4_lt_util matches 0 if score $levels gm4_lt_util matches 1..15 run scoreboard players operation $level_calc gm4_lt_util *= #2 gm4_lt_util
execute if score $points gm4_lt_util matches 0 if score $levels gm4_lt_util matches 1..15 run scoreboard players add $level_calc gm4_lt_util 7
execute if score $points gm4_lt_util matches 0 if score $levels gm4_lt_util matches 16..30 run scoreboard players operation $level_calc gm4_lt_util *= #5 gm4_lt_util
execute if score $points gm4_lt_util matches 0 if score $levels gm4_lt_util matches 16..30 run scoreboard players remove $level_calc gm4_lt_util 38
execute if score $points gm4_lt_util matches 0 if score $levels gm4_lt_util matches 31.. run scoreboard players operation $level_calc gm4_lt_util *= #9 gm4_lt_util
execute if score $points gm4_lt_util matches 0 if score $levels gm4_lt_util matches 31.. run scoreboard players remove $level_calc gm4_lt_util 158

# decrease points to whatever will fit into the tank
scoreboard players set $overflow_calc gm4_lt_util 5345
scoreboard players operation $overflow_calc gm4_lt_util -= @e[type=marker,tag=gm4_liquid_tank,limit=1,distance=..0.5] gm4_lt_value
scoreboard players operation $level_calc gm4_lt_util < $overflow_calc gm4_lt_util

# add points to tank and remove from player
scoreboard players operation @e[type=marker,tag=gm4_liquid_tank,limit=1,distance=..0.5] gm4_lt_value += $level_calc gm4_lt_util
scoreboard players set #-1 gm4_lt_util -1
scoreboard players operation $level_calc gm4_lt_util *= #-1 gm4_lt_util
execute store result storage gm4_liquid_tanks:temp exp.points int 1.0 run scoreboard players get $level_calc gm4_lt_util
function gm4_standard_liquids:util/experience/macro_experience with storage gm4_liquid_tanks:temp exp
execute as @e[type=marker,tag=gm4_liquid_tank,limit=1,distance=..0.5] unless score @s gm4_lt_prior_val = @s gm4_lt_value run function gm4_liquid_tanks:liquid_value_update

# vfx
execute unless score $level_calc gm4_lt_util matches 0 playsound minecraft:entity.experience_orb.pickup block @s
function #gm4_liquid_tanks:level_report_check

# reset accelerating clock
scoreboard players add @s gm4_lt_value 1
execute if score @s gm4_lt_value matches 1..4 run scoreboard players set @s gm4_lt_util 16
execute if score @s gm4_lt_value matches 5..10 run scoreboard players set @s gm4_lt_util 12
execute if score @s gm4_lt_value matches 11..18 run scoreboard players set @s gm4_lt_util 8
execute if score @s gm4_lt_value matches 19.. run scoreboard players set @s gm4_lt_util 4
