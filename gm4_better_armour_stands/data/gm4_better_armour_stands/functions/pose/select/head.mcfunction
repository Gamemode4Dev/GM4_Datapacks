# @s = armor_stand to be modified
# at @s
# run from pose/select

scoreboard players set @s gm4_bas_mode 1

# spawn markers
execute if score @s gm4_bas_data matches 0 run summon marker ~ ~1.4 ~ {CustomName:'"gm4_bas_head"',Tags:["gm4_bas_joint","gm4_bas_head","gm4_bas_marker","gm4_bas_new","gm4_bas_temp"]}
execute if score @s gm4_bas_data matches 1 run summon marker ~ ~.7 ~ {CustomName:'"gm4_bas_head"',Tags:["gm4_bas_joint","gm4_bas_head","gm4_bas_marker","gm4_bas_new","gm4_bas_temp"]}
