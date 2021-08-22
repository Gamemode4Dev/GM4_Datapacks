# @s = armor_stand to be modified
# at @s
# run from apply_book

scoreboard players add @s gm4_bas_turn 1
execute unless score @s gm4_bas_turn matches 0..2 run scoreboard players set @s gm4_bas_turn 0
execute if score @s gm4_bas_turn matches 1 run tag @s add gm4_bas_turn
execute if score @s gm4_bas_turn matches 0 run tag @s remove gm4_bas_turn

tag @s add gm4_bas_modified
advancement grant @p[tag=gm4_bas_active] only gm4:better_armour_stands
