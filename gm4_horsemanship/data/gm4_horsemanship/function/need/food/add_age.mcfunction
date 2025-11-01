
scoreboard players operation $age gm4_horse_data += $add_age gm4_horse_data
scoreboard players operation $age gm4_horse_data < #0 gm4_horse_data
execute store result entity @s Age int 1 run scoreboard players get $age gm4_horse_data
