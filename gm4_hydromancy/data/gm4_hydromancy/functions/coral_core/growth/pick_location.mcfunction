# pick a column to grow a plant in
# @s = growth marker
# at linked coral flower
# run from coral_core/process

execute store result score $x gm4_hy_data run data get entity @s UUID[0]
execute store result score $z gm4_hy_data run data get entity @s UUID[1]
scoreboard players operation $x gm4_hy_data %= #15 gm4_hy_data
scoreboard players operation $z gm4_hy_data %= #15 gm4_hy_data
scoreboard players operation $x gm4_hy_data *= #10 gm4_hy_data
scoreboard players operation $z gm4_hy_data *= #10 gm4_hy_data
execute store result score $x_ori gm4_hy_data run data get entity @s Pos[0] 10
execute store result score $z_ori gm4_hy_data run data get entity @s Pos[2] 10
execute store result entity @s Pos[0] double 0.1 run scoreboard players operation $x_ori gm4_hy_data += $x gm4_hy_data
execute store result entity @s Pos[2] double 0.1 run scoreboard players operation $z_ori gm4_hy_data += $z gm4_hy_data

scoreboard players set $raycast_limit gm4_hy_data 9
execute at @s unless block ~ ~ ~ #gm4_hydromancy:expected_aquarium_blocks run function gm4_hydromancy:coral_core/growth/raycast
kill @s
