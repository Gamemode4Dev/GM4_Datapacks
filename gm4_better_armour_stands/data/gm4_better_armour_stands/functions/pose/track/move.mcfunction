# @s = armor_stand to be modified
# at @p[tag=gm4_bas_track] positioned ~ ~1.6 ~
# run from pose/track/update

# move armor_stand in front of player
execute if score @s gm4_bas_dist matches 5 run tp @s ^ ^ ^.5
execute if score @s gm4_bas_dist matches 10 run tp @s ^ ^ ^1
execute if score @s gm4_bas_dist matches 15 run tp @s ^ ^ ^1.5
execute if score @s gm4_bas_dist matches 20 run tp @s ^ ^ ^2
execute if score @s gm4_bas_dist matches 25 run tp @s ^ ^ ^2.5
execute if score @s gm4_bas_dist matches 30 run tp @s ^ ^ ^3
execute if score @s gm4_bas_dist matches 35 run tp @s ^ ^ ^3.5
execute if score @s gm4_bas_dist matches 40 run tp @s ^ ^ ^4
execute if score @s gm4_bas_dist matches 45 run tp @s ^ ^ ^4.5
execute if score @s gm4_bas_dist matches 50 run tp @s ^ ^ ^5

# armour stand position
execute store result score $as_pos_x gm4_bas_data run data get entity @s[tag=!gm4_bas_move_alt] Pos[0] 1000
execute store result score $as_pos_z gm4_bas_data run data get entity @s[tag=!gm4_bas_move_alt] Pos[2] 1000
execute store result score $as_pos_y gm4_bas_data run data get entity @s Pos[1] 1000

# add difference to position
execute store result entity @s[tag=!gm4_bas_move_alt] Pos[0] double .001 run scoreboard players operation $as_pos_x gm4_bas_data += @s gm4_bas_dx
execute store result entity @s[tag=!gm4_bas_move_alt] Pos[2] double .001 run scoreboard players operation $as_pos_z gm4_bas_data += @s gm4_bas_dz
execute store result entity @s Pos[1] double .001 run scoreboard players operation $as_pos_y gm4_bas_data += @s gm4_bas_dy

# round up position to multiples of 1/8th of a block
execute if entity @p[tag=gm4_bas_track,predicate=gm4_better_armour_stands:sneaking] run function gm4_better_armour_stands:pose/snap/position
