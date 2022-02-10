# @s = expeditious tp AEC
# run from pneumas/expeditious/tp_aec

execute at @s run tp @s ~ ~-1 ~
scoreboard players add set_y gm4_pneuma_data 1
scoreboard players set expeditious_safe gm4_pneuma_data 0
execute at @s if block ~ ~ ~ #gm4:no_collision unless block ~ ~-1 ~ #gm4:no_collision run scoreboard players set expeditious_safe gm4_pneuma_data 1
execute if score expeditious_safe gm4_pneuma_data matches 1 run scoreboard players set expeditious_attempt gm4_pneuma_data 12
execute unless score set_y gm4_pneuma_data matches 11.. at @s unless score expeditious_safe gm4_pneuma_data matches 1 run function gm4_orb_of_ankou:pneumas/expeditious/set_ypos
