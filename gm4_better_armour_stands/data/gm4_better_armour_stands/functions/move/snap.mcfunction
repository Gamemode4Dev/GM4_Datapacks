# @s = armor_stand being moved
# at @s
# run from move/moving

# move armor_stand
tp @s ^ ^ ^2

# round to nearest 1/16th of a block
execute store result score $as_pos_x gm4_bas_data run data get entity @s Pos[0] 16
execute store result entity @s Pos[0] double .0625 run scoreboard players get $as_pos_x gm4_bas_data

execute store result score $as_pos_y gm4_bas_data run data get entity @s Pos[1] 16
execute store result entity @s Pos[1] double .0625 run scoreboard players get $as_pos_y gm4_bas_data

execute store result score $as_pos_z gm4_bas_data run data get entity @s Pos[2] 16
execute store result entity @s Pos[2] double .0625 run scoreboard players get $as_pos_z gm4_bas_data
