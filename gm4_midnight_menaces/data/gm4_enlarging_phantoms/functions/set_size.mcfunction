# @s = enlarged phantom
# called by set_pos

execute store result score @s gm4_menace_data run data get entity @s UUID[0]
scoreboard players operation @s gm4_menace_data %= 100 gm4_menace_data

# 35% size 3, 40% size 5, 25% size 7
data merge entity @s[scores={gm4_menace_data=..34}] {Size:3,Health:24.0f,Attributes:[{Name:"generic.max_health",Base:24.0d},{Name:"generic.attack_damage",Base:5.0d}]}
data merge entity @s[scores={gm4_menace_data=35..74}] {Size:5,Health:30.0f,Attributes:[{Name:"generic.max_health",Base:30.0d},{Name:"generic.attack_damage",Base:7.0d}]}
data merge entity @s[scores={gm4_menace_data=75..}] {Size:7,Health:40.0f,Attributes:[{Name:"generic.max_health",Base:40.0d},{Name:"generic.attack_damage",Base:9.0d}]}

scoreboard players reset @s gm4_menace_data
