# @s = player with expeditious pneuma who stopped sneaking
# run from pneumas/sneak/stopped

summon marker ~ ~ ~ {CustomName:'"Expeditious TP"',Tags:["gm4_oa_expeditious"]}
tp @e[type=marker,tag=gm4_oa_expeditious,limit=1] @s

scoreboard players set @s gm4_pneuma_data 0
scoreboard players set @s[scores={gm4_oa_snk_num=10..19}] gm4_pneuma_data 9
scoreboard players set @s[scores={gm4_oa_snk_num=20..39}] gm4_pneuma_data 17
scoreboard players set @s[scores={gm4_oa_snk_num=40..59}] gm4_pneuma_data 25
scoreboard players set @s[scores={gm4_oa_snk_num=60..}] gm4_pneuma_data 33

execute if score @s gm4_pneuma_data matches 9 run tp @e[type=marker,tag=gm4_oa_expeditious,limit=1] ~-4 ~ ~-4
execute if score @s gm4_pneuma_data matches 17 run tp @e[type=marker,tag=gm4_oa_expeditious,limit=1] ~-8 ~ ~-8
execute if score @s gm4_pneuma_data matches 25 run tp @e[type=marker,tag=gm4_oa_expeditious,limit=1] ~-12 ~ ~-12
execute if score @s gm4_pneuma_data matches 33 run tp @e[type=marker,tag=gm4_oa_expeditious,limit=1] ~-16 ~ ~-16

execute store result score y_pos gm4_pneuma_data run data get entity @s Pos[1]
execute store result score randomX gm4_pneuma_data run data get entity @e[type=marker,tag=gm4_oa_expeditious,limit=1] UUID[0]
scoreboard players set expeditious_attempt gm4_pneuma_data 0
tag @s add gm4_expeditious_player
function gm4_orb_of_ankou:pneumas/expeditious/randomize
tag @s remove gm4_expeditious_player

execute if score expeditious_safe gm4_pneuma_data matches 1 run function gm4_orb_of_ankou:pneumas/expeditious/tp_player
kill @e[type=marker,tag=gm4_oa_expeditious]
