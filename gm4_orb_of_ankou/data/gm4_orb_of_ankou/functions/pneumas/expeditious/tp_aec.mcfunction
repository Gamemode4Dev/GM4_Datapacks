# @s = expeditious tp AEC
# run from pneumas/expeditious/randomize

execute at @s if score randomX gm4_pneuma_data matches 32.. run tp @s ~32 ~ ~
execute if score randomX gm4_pneuma_data matches 32.. run scoreboard players remove randomX gm4_pneuma_data 32
execute at @s if score randomX gm4_pneuma_data matches 16.. run tp @s ~16 ~ ~
execute if score randomX gm4_pneuma_data matches 16.. run scoreboard players remove randomX gm4_pneuma_data 16
execute at @s if score randomX gm4_pneuma_data matches 8.. run tp @s ~8 ~ ~
execute if score randomX gm4_pneuma_data matches 8.. run scoreboard players remove randomX gm4_pneuma_data 8
execute at @s if score randomX gm4_pneuma_data matches 4.. run tp @s ~4 ~ ~
execute if score randomX gm4_pneuma_data matches 4.. run scoreboard players remove randomX gm4_pneuma_data 4
execute at @s if score randomX gm4_pneuma_data matches 2.. run tp @s ~2 ~ ~
execute if score randomX gm4_pneuma_data matches 2.. run scoreboard players remove randomX gm4_pneuma_data 2
execute at @s if score randomX gm4_pneuma_data matches 1.. run tp @s ~1 ~ ~
execute if score randomX gm4_pneuma_data matches 1.. run scoreboard players remove randomX gm4_pneuma_data 1

execute at @s if score randomZ gm4_pneuma_data matches 32.. run tp @s ~ ~ ~32
execute if score randomZ gm4_pneuma_data matches 32.. run scoreboard players remove randomZ gm4_pneuma_data 32
execute at @s if score randomZ gm4_pneuma_data matches 16.. run tp @s ~ ~ ~16
execute if score randomZ gm4_pneuma_data matches 16.. run scoreboard players remove randomZ gm4_pneuma_data 16
execute at @s if score randomZ gm4_pneuma_data matches 8.. run tp @s ~ ~ ~8
execute if score randomZ gm4_pneuma_data matches 8.. run scoreboard players remove randomZ gm4_pneuma_data 8
execute at @s if score randomZ gm4_pneuma_data matches 4.. run tp @s ~ ~ ~4
execute if score randomZ gm4_pneuma_data matches 4.. run scoreboard players remove randomZ gm4_pneuma_data 4
execute at @s if score randomZ gm4_pneuma_data matches 2.. run tp @s ~ ~ ~2
execute if score randomZ gm4_pneuma_data matches 2.. run scoreboard players remove randomZ gm4_pneuma_data 2
execute at @s if score randomZ gm4_pneuma_data matches 1.. run tp @s ~ ~ ~1
execute if score randomZ gm4_pneuma_data matches 1.. run scoreboard players remove randomZ gm4_pneuma_data 1

execute store result entity @s Pos[1] double 1 run scoreboard players get y_pos gm4_pneuma_data
execute at @s run tp @s ~ ~5 ~
scoreboard players set set_y gm4_pneuma_data 0
execute at @s run function gm4_orb_of_ankou:pneumas/expeditious/set_ypos

scoreboard players add expeditious_attempt gm4_pneuma_data 1
execute unless score expeditious_attempt gm4_pneuma_data matches 12.. run function gm4_orb_of_ankou:pneumas/expeditious/randomize
