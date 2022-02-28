# run from slow_clock
# @s = every online player


# difficulty score is calculated as:
# minecraft weeks spend online (max 10) divided by 8 - days alive
# THIS IS OLD AND WILL BE REPLACED WITH A NEW SYSTEM
scoreboard players operation $weeks_online gm4_ai_difficult = @s gm4_ai_playtime
scoreboard players operation $weeks_online gm4_ai_difficult /= #168000 gm4_ai_difficult
scoreboard players operation $weeks_online gm4_ai_difficult < #10 gm4_ai_difficult

scoreboard players operation $days_alive gm4_ai_difficult = @s gm4_ai_alivetime
scoreboard players operation $days_alive gm4_ai_difficult /= #24000 gm4_ai_difficult

scoreboard players set $modifier gm4_ai_difficult 8
scoreboard players operation $modifier gm4_ai_difficult -= $days_alive gm4_ai_difficult
scoreboard players operation $modifier gm4_ai_difficult > #1 gm4_ai_difficult

execute store result score @s gm4_ai_difficult run scoreboard players operation $weeks_online gm4_ai_difficult /= $modifier gm4_ai_difficult

# scale down depending on world difficulty
execute store result score $worlddiff gm4_ai_data run difficulty
execute if score $worlddiff gm4_ai_data matches 1 run scoreboard players remove @s gm4_ai_difficult 3
execute if score $worlddiff gm4_ai_data matches 2 run scoreboard players remove @s gm4_ai_difficult 1

# add challenge armor, this can exceed the normal cap of 10
execute if predicate gm4_armor_identification:modified_armor/challenge/head run scoreboard players add @s gm4_ai_difficult 1
execute if predicate gm4_armor_identification:modified_armor/challenge/chest run scoreboard players add @s gm4_ai_difficult 1
execute if predicate gm4_armor_identification:modified_armor/challenge/legs run scoreboard players add @s gm4_ai_difficult 1
execute if predicate gm4_armor_identification:modified_armor/challenge/feet run scoreboard players add @s gm4_ai_difficult 1

# set to at least 0
scoreboard players operation @s gm4_ai_difficult > #0 gm4_ai_data
