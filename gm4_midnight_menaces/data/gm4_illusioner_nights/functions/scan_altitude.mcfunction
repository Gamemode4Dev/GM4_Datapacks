#@s = @e[type=area_effect_cloud,tag=gm4_illusioner_spawn_point]
#at @s
#called by set_pos

tp ~ ~1 ~
scoreboard players add @s gm4_menace 1
execute unless block ~ ~ ~ #midnight_menaces:air unless score @s gm4_menace matches 11.. at @s run function gm4_illusioner_nights:scan_altitude
