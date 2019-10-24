# @s = player who drank from any honey bottle
# run from ambrosia:pulse_check

# branch off into different honey levels
execute as @s[tag=gm4_drank_honey_level_9] run function ambrosia:honey_bottle/give_new_bottle/level_8
execute as @s[tag=gm4_drank_honey_level_8] run function ambrosia:honey_bottle/give_new_bottle/level_7
execute as @s[tag=gm4_drank_honey_level_7] run function ambrosia:honey_bottle/give_new_bottle/level_6
execute as @s[tag=gm4_drank_honey_level_6] run function ambrosia:honey_bottle/give_new_bottle/level_5
execute as @s[tag=gm4_drank_honey_level_5] run function ambrosia:honey_bottle/give_new_bottle/level_4
execute as @s[tag=gm4_drank_honey_level_4] run function ambrosia:honey_bottle/give_new_bottle/level_3
execute as @s[tag=gm4_drank_honey_level_3] run function ambrosia:honey_bottle/give_new_bottle/level_2
execute as @s[tag=gm4_drank_honey_level_2] run function ambrosia:honey_bottle/give_new_bottle/level_1

# reset tags
tag @s remove gm4_drank_honey

# reset fake player switch
scoreboard players reset player_consumed_honey gm4_bee_data
