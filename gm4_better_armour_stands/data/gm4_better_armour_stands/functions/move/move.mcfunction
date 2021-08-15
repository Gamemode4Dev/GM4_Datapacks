# @s = armor_stand to be moved
# at @s
# run from apply_pose

scoreboard players add @s gm4_bas_data 1
execute unless score @s gm4_bas_data matches 0..1 run scoreboard players set @s gm4_bas_data 0
execute if score @s gm4_bas_data matches 0 run function gm4_better_armour_stands:move/stop
execute if score @s gm4_bas_data matches 1 run function gm4_better_armour_stands:move/select
