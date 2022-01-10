# @s = armor_stand to be moved
# at @s
# run from pose/select/move/ray

tag @e remove gm4_bas_stop_ray
summon marker ~ ~ ~ {Tags:["gm4_bas_temp_offset"]}

# player position
execute as @e[type=marker,tag=gm4_bas_temp_offset,limit=1] store result score @s gm4_bas_dx run data get entity @s Pos[0] 1000
execute as @e[type=marker,tag=gm4_bas_temp_offset,limit=1] store result score @s gm4_bas_dy run data get entity @s Pos[1] 1000
execute as @e[type=marker,tag=gm4_bas_temp_offset,limit=1] store result score @s gm4_bas_dz run data get entity @s Pos[2] 1000

# armour stand position
execute store result score @s gm4_bas_dx run data get entity @s Pos[0] 1000
execute store result score @s gm4_bas_dy run data get entity @s Pos[1] 1000
execute store result score @s gm4_bas_dz run data get entity @s Pos[2] 1000

# difference in positions
scoreboard players operation @s gm4_bas_dx -= @e[type=marker,tag=gm4_bas_temp_offset,limit=1] gm4_bas_dx
scoreboard players operation @s gm4_bas_dy -= @e[type=marker,tag=gm4_bas_temp_offset,limit=1] gm4_bas_dy
scoreboard players operation @s gm4_bas_dz -= @e[type=marker,tag=gm4_bas_temp_offset,limit=1] gm4_bas_dz

kill @e[type=marker,tag=gm4_bas_temp_offset,distance=..1]
