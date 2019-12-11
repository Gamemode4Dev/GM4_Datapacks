#@s = spawner minecarts
#run from rail_checks

tag @s add gm4_processing_spawner
summon area_effect_cloud ~-4 ~ ~-4 {Duration:10,CustomName:'"gm4_spawner_flower_checker"',Tags:["gm4_spawner_flower_checker"]}

#calculate random position
execute store result score randomX gm4_spawner_fuel run data get entity @e[tag=gm4_spawner_flower_checker,limit=1] UUIDMost 0.00000000023283064365386962890625
scoreboard players operation randomZ gm4_spawner_fuel = randomX gm4_spawner_fuel

scoreboard players set 10 gm4_spawner_fuel 10
scoreboard players operation randomZ gm4_spawner_fuel %= 10 gm4_spawner_fuel

scoreboard players set 9 gm4_spawner_fuel 9
scoreboard players operation randomX gm4_spawner_fuel %= 9 gm4_spawner_fuel
scoreboard players operation randomZ gm4_spawner_fuel %= 9 gm4_spawner_fuel

#move the entity
execute as @e[tag=gm4_spawner_flower_checker] at @s run function spawner_minecarts:fuel/check_for_flower

#re-enable spawning
execute if score @s gm4_spawner_fuel matches 1.. run data merge entity @s {RequiredPlayerRange:16s}

tag @s remove gm4_processing_spawner
