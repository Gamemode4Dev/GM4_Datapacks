# Find player looking at ender chest
# @s = all players
# at @s
# run from main

execute positioned ^ ^ ^.5 if block ~ ~ ~ ender_chest run function gm4_xp_storage:point_report
execute positioned ^ ^ ^1.5 if block ~ ~ ~ ender_chest run function gm4_xp_storage:point_report
execute positioned ^ ^ ^2.5 if block ~ ~ ~ ender_chest run function gm4_xp_storage:point_report
execute positioned ^ ^ ^3.5 if block ~ ~ ~ ender_chest run function gm4_xp_storage:point_report

tag @s remove gm4_xp_storage_found_echest
