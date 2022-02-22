# run from main
# @s = mobs that can be buffed
# at @s

# get difficulty score from the nearest player, scale down depending on world difficulty
scoreboard players operation $difficulty gm4_ai_data = @p[gamemode=!creative,gamemode=!spectator] gm4_ai_difficult
execute store result score $worlddiff gm4_ai_data run difficulty
execute if score $worlddiff gm4_ai_data matches 1 run scoreboard players remove $difficulty gm4_ai_data 3
execute if score $worlddiff gm4_ai_data matches 2 run scoreboard players remove $difficulty gm4_ai_data 1
scoreboard players operation $difficulty gm4_ai_data > #0 gm4_ai_data

# equip with armor
execute if entity @s[type=zombie] run function gm4_armor_identification:mobs/zombie

# mark mob as processed
tag @s add gm4_ai_initiated
