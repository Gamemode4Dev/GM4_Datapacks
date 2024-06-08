# calculate modifiers for newly spawned ravager
# @s = ravager
# at @s
# run from mob/init/difficulty/check_type

# get data
execute store result score $wave gm4_ce_data run data get entity @s Wave

# | Modifiers
# raider
scoreboard players set $difficulty_add gm4_ce_data 4
scoreboard players operation $difficulty_add gm4_ce_data *= $wave gm4_ce_data
scoreboard players operation $difficulty gm4_ce_data += $difficulty_add gm4_ce_data

