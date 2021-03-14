#@s = @e[type=area_effect_cloud,tag=gm4_goblin_spawn_point]
#at @s
#called by set_pos

tp ~ ~1 ~
scoreboard players add @s gm4_menace_data 1
execute unless block ~ ~ ~ #gm4:air unless score @s gm4_menace_data matches 11.. at @s run function gm4_menacing_goblins:scan_altitude
