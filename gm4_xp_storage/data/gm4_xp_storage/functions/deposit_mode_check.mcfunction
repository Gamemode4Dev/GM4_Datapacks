#@s = as [players on top of ender chests] at @s
#run from main

#players who were not sneaking on an ender-chest last pulse and are now sneaking run dump-all
execute if score @s[tag=gm4_was_on_ender_chest] gm4_xp_sneaking matches 1.. run scoreboard players set xp_dump_all_counter gm4_xp_calc 1
execute if score @s[tag=gm4_was_on_ender_chest] gm4_xp_sneaking matches 1.. unless entity @s[level=0] run function gm4_xp_storage:dump_all

#players who are not sneaking deposit a single level
execute unless score @s gm4_xp_sneaking matches 1.. unless entity @s[level=0] run function gm4_xp_storage:dump_level

tag @s[scores={gm4_xp_sneaking=0}] remove gm4_was_on_ender_chest

#tag all players who are currently on e-chest but aren't sneaking
tag @s[scores={gm4_xp_sneaking=0}] add gm4_was_on_ender_chest
scoreboard players set @s gm4_xp_sneaking 0
