# run from armor/active/vorpal/attempt
# @s = player wearing vorpal armor being damaged
# at @s
# code taken from Orb of Ankou - expeditious

scoreboard players operation $randomZ gm4_ai_data = $randomX gm4_ai_data
scoreboard players operation $randomZ gm4_ai_data %= #64 gm4_ai_data

scoreboard players operation $randomX gm4_ai_data %= #17 gm4_ai_data
scoreboard players operation $randomZ gm4_ai_data %= #17 gm4_ai_data

execute as @e[type=marker,tag=gm4_ai_vorpal] at @s run function gm4_armor_identification:armor/modifiers/type/vorpal/tp_marker
