#ran at a landmine items dropped on the ground
#@s = tnt landmine item
execute unless entity @e[type=armor_stand,tag=gm4_tnt_mine,distance=..1.5] run function gm4_tnt_landmines:items/create
tag @s add gm4_mine_checked
