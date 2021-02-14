# @s = tnt landmine item
# run from main

execute unless entity @e[type=armor_stand,tag=gm4_tnt_mine,distance=..1.5] positioned ~ ~-1 ~ unless block ~ ~ ~ air run function gm4_tnt_landmines:items/create
tag @s add gm4_mine_checked
