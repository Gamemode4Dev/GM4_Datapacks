# run from main
# @s = mobs that can be buffed
# at @s

scoreboard players reset $mob_extras gm4_ai_data

# get difficulty score from the nearest player, scale down depending on world difficulty
scoreboard players operation $difficulty gm4_ai_data = @p[gamemode=!creative,gamemode=!spectator] gm4_ai_difficult
execute store result score $worlddiff gm4_ai_data run difficulty
execute if score $worlddiff gm4_ai_data matches 1 run scoreboard players remove $difficulty gm4_ai_data 3
execute if score $worlddiff gm4_ai_data matches 2 run scoreboard players remove $difficulty gm4_ai_data 1
scoreboard players operation $difficulty gm4_ai_data > #0 gm4_ai_data

# reset scoreboards
scoreboard players set $mob_stats gm4_ai_data 0
scoreboard players set $mob_health gm4_ai_data 0
scoreboard players set $mob_damage gm4_ai_data 0
scoreboard players set $mob_speed gm4_ai_data 0
scoreboard players set $mob_armor gm4_ai_data 0
scoreboard players set $mob_toughness gm4_ai_data 0

# initialize different mobs
execute if entity @s[type=zombie] run function gm4_armor_identification:mobs/zombie

# mark mob as processed
tag @s add gm4_ai_initiated
tag @s remove gm4_ai_extra_mob

# process any spawned mobs
execute if score $mob_extras gm4_ai_data matches 1.. as @e[tag=gm4_ai_extra_mob] at @s run function gm4_armor_identification:mobs/initiate
