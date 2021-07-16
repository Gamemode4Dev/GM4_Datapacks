# @s = player with expeditious pneuma who stopped sneaking
# run from pneumas/sneak/stopped

summon area_effect_cloud ~ ~ ~ {CustomName:'"Expeditious TP"',Tags:["gm4_oa_expeditious"],Duration:1}
tp @e[type=area_effect_cloud,tag=gm4_oa_expeditious,distance=..0.001,limit=1] @s

scoreboard players set @s[scores={gm4_oa_snk_num=3..5}] gm4_pneuma_data 9
scoreboard players set @s[scores={gm4_oa_snk_num=6..8}] gm4_pneuma_data 17
scoreboard players set @s[scores={gm4_oa_snk_num=9..13}] gm4_pneuma_data 25
scoreboard players set @s[scores={gm4_oa_snk_num=14..}] gm4_pneuma_data 33

execute if score @s gm4_pneuma_data matches 9 run tp @e[tag=gm4_oa_expeditious,limit=1] ~-4 ~ ~-4
execute if score @s gm4_pneuma_data matches 17 run tp @e[tag=gm4_oa_expeditious,limit=1] ~-8 ~ ~-8
execute if score @s gm4_pneuma_data matches 25 run tp @e[tag=gm4_oa_expeditious,limit=1] ~-12 ~ ~-12
execute if score @s gm4_pneuma_data matches 33 run tp @e[tag=gm4_oa_expeditious,limit=1] ~-16 ~ ~-16

execute store result score y_pos gm4_pneuma_data run data get entity @s Pos[1]
execute store result score randomX gm4_pneuma_data run data get entity @e[tag=gm4_oa_expeditious,limit=1] UUID[0]
scoreboard players set expeditious_attempt gm4_pneuma_data 0
tag @s add gm4_expeditious_player
function gm4_orb_of_ankou:pneumas/expeditious/randomize
tag @s remove gm4_expeditious_player

execute if score expeditious_safe gm4_pneuma_data matches 1 run function gm4_orb_of_ankou:pneumas/expeditious/tp_player
