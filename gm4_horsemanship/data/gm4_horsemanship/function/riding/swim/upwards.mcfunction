
execute store result score $motion_y gm4_horse_data run data get entity @s Motion[1] 200

scoreboard players add @s[scores={gm4_horse.swim_power=..19}] gm4_horse.swim_power 1

execute if score $motion_y gm4_horse_data matches ..0 run scoreboard players operation $motion_y gm4_horse_data += @s gm4_horse.swim_power
execute store result entity @s Motion[1] double 0.005 run scoreboard players get $motion_y gm4_horse_data
