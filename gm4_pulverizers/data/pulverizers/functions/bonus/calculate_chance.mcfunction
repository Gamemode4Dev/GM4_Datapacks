#@s = pulverizers containing a recipe results
#Run from bonus/apply_bonus

scoreboard players operation seed gm4_pv_bonus *= mult gm4_pv_bonus
scoreboard players operation seed gm4_pv_bonus += incr gm4_pv_bonus
scoreboard players operation result gm4_pv_bonus = seed gm4_pv_bonus
scoreboard players operation result gm4_pv_bonus /= #100 gm4_pv_bonus
scoreboard players operation result gm4_pv_bonus %= #100 gm4_pv_bonus

execute if score result gm4_pv_bonus <= required gm4_pv_bonus run scoreboard players operation bonus_stack gm4_stack_size += count gm4_pv_bonus

scoreboard players remove @s gm4_pv_bonus 1
execute if score @s gm4_pv_bonus matches 1.. run function pulverizers:bonus/calculate_chance
