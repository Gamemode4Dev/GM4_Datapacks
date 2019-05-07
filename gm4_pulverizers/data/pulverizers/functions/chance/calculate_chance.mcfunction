#@s = pulverizers containing a recipe results
#Run from chance/apply_chance

scoreboard players operation seed gm4_pv_chance *= mult gm4_pv_chance
scoreboard players operation seed gm4_pv_chance += incr gm4_pv_chance
scoreboard players operation result gm4_pv_chance = seed gm4_pv_chance
scoreboard players operation result gm4_pv_chance /= #100 gm4_pv_chance
scoreboard players operation result gm4_pv_chance %= #100 gm4_pv_chance

function pulverizers:chance/set_stack_count

scoreboard players remove @s gm4_pv_chance 1
execute if score @s gm4_pv_chance matches 1.. run function pulverizers:chance/calculate_chance