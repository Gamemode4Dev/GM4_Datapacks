
# reduce remaining Age by 10%
execute store result score $age gm4_horse_data run data get entity @s Age
execute store result entity @s Age int 0.9 run scoreboard players get $age gm4_horse_data
