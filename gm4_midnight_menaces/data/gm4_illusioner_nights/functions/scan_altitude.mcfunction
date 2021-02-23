# @s = illusioner spawn point AEC
# at @s
# called by set_pos

tp ~ ~1 ~
scoreboard players add @s gm4_menace_data 1
execute unless block ~ ~ ~ #gm4:air unless score @s gm4_menace_data matches 11.. at @s run function gm4_illusioner_nights:scan_altitude
