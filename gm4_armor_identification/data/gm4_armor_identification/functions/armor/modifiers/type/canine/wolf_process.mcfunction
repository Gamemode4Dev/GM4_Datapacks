# run from main
# @s = wolf from canine armor

execute if score @s gm4_ai_t_wolf matches 0 at @s run function gm4_armor_identification:armor/modifiers/type/canine/wolf_kill
scoreboard players set @s gm4_ai_t_wolf 0
