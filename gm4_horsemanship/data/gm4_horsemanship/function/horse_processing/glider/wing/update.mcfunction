
execute on vehicle store result score $set_yaw gm4_horse_data run data get entity @s Rotation[0] 100
execute if entity @s[tag=gm4_horse.glider_wing.right] run scoreboard players add $set_yaw gm4_horse_data 8850
execute if entity @s[tag=gm4_horse.glider_wing.left] run scoreboard players remove $set_yaw gm4_horse_data 9150
execute store result entity @s Rotation[0] float 0.01 run scoreboard players get $set_yaw gm4_horse_data

execute store result entity @s Rotation[1] float 0.01 run function gm4_horsemanship:horse_processing/glider/wing/calculate_wing_pitch
