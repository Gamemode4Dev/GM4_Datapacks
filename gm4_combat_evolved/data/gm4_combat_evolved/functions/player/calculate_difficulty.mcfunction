# run from slow_clock
# @s = every online player

# difficulty calculations
# get amount of weeks player has been online (starting at 1, max 10)
scoreboard players operation $weeks_online gm4_ce_difficult = @s gm4_ce_playtime
scoreboard players operation $weeks_online gm4_ce_difficult /= #168000 gm4_ce_data
scoreboard players add $weeks_online gm4_ce_difficult 1
scoreboard players operation $weeks_online gm4_ce_difficult < #10 gm4_ce_data
# get amount of days since last player death (starting at 1, max 10)
scoreboard players operation $days_alive gm4_ce_difficult = @s gm4_ce_alivetime
scoreboard players operation $days_alive gm4_ce_difficult /= #24000 gm4_ce_data
scoreboard players add $days_alive gm4_ce_difficult 1
scoreboard players operation $days_alive gm4_ce_difficult < #10 gm4_ce_data
# set player difficulty to weeks*days
scoreboard players operation @s gm4_ce_difficult = $days_alive gm4_ce_difficult
scoreboard players operation @s gm4_ce_difficult *= $weeks_online gm4_ce_difficult
# get world difficulty
execute store result score $worlddiff gm4_ce_data run difficulty
# modify player difficulty (-0 for hard, -2 for normal, -4 for easy)
execute if score $worlddiff gm4_ce_data matches 2 run scoreboard players remove @s gm4_ce_difficult 2
execute if score $worlddiff gm4_ce_data matches 1 run scoreboard players remove @s gm4_ce_difficult 4
# multiply by 10 to get decimal
scoreboard players operation @s gm4_ce_difficult *= #10 gm4_ce_data
# divide by 10 for hard, 13 for normal, 14 for easy 
execute if score $worlddiff gm4_ce_data matches 3 run scoreboard players operation @s gm4_ce_difficult /= #10 gm4_ce_data
execute if score $worlddiff gm4_ce_data matches 2 run scoreboard players operation @s gm4_ce_difficult /= #13 gm4_ce_data
execute if score $worlddiff gm4_ce_data matches 1 run scoreboard players operation @s gm4_ce_difficult /= #14 gm4_ce_data
# add 5 then divide by 10 to round to nearest integer
scoreboard players add @s gm4_ce_difficult 5
scoreboard players operation @s gm4_ce_difficult /= #10 gm4_ce_data
# add challenge armor, this can exceed the normal cap of 10
execute if predicate gm4_combat_evolved:modified_armor/challenge/head run scoreboard players add @s gm4_ce_difficult 1
execute if predicate gm4_combat_evolved:modified_armor/challenge/chest run scoreboard players add @s gm4_ce_difficult 1
execute if predicate gm4_combat_evolved:modified_armor/challenge/legs run scoreboard players add @s gm4_ce_difficult 1
execute if predicate gm4_combat_evolved:modified_armor/challenge/feet run scoreboard players add @s gm4_ce_difficult 1