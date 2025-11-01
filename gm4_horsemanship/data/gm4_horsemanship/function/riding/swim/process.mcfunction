
scoreboard players set $mounted gm4_horse_data 0
execute store success score $mounted gm4_horse_data on controller if entity @s[type=player]

execute if score $mounted gm4_horse_data matches 1 if entity @s[tag=!gm4_horse.swimming] if block ~ ~0.6 ~ water run tag @s add gm4_horse.swimming
execute if score $mounted gm4_horse_data matches 1 if entity @s[tag=gm4_horse.swimming] unless block ~ ~0.35 ~ water run tag @s remove gm4_horse.swimming
execute if score $mounted gm4_horse_data matches 0 if entity @s[tag=gm4_horse.swimming] run tag @s remove gm4_horse.swimming

scoreboard players set @s[tag=!gm4_horse.swimming] gm4_horse.swim_power 0
execute if entity @s[tag=gm4_horse.swimming,tag=!gm4_horse.tired] run function gm4_horsemanship:riding/swim/upwards
