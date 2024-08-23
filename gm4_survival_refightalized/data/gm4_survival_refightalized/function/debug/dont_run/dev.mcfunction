execute store result score $dev.difficulty gm4_sr_data run scoreboard players get @s gm4_sr_mob_difficulty
execute store result score $dev.health_max gm4_sr_data run attribute @s generic.max_health get 1
execute store result score $dev.health_curr gm4_sr_data run data get entity @s Health
execute store result score $worlddiff gm4_sr_data run difficulty
execute if score $worlddiff gm4_sr_data matches 1 store result score $dev.damage gm4_sr_data run attribute @s generic.attack_damage get 77
execute if score $worlddiff gm4_sr_data matches 2 store result score $dev.damage gm4_sr_data run attribute @s generic.attack_damage get 100
execute if score $worlddiff gm4_sr_data matches 3 store result score $dev.damage gm4_sr_data run attribute @s generic.attack_damage get 150
scoreboard players operation $dev.damage_10 gm4_sr_data = $dev.damage gm4_sr_data
scoreboard players operation $dev.damage_10 gm4_sr_data /= #100 gm4_sr_data
scoreboard players operation $dev.damage_1 gm4_sr_data = $dev.damage gm4_sr_data
scoreboard players operation $dev.damage_1 gm4_sr_data %= #100 gm4_sr_data
execute store result score $dev.speed gm4_sr_data run attribute @s generic.movement_speed get 100
execute at @s run particle firework ~ ~1 ~ 0.2 0.5 0.2 0 3 force @p[tag=gm4_sr_dev]
title @p[tag=gm4_sr_dev] actionbar [{"text":"Diff: ","color":"gray"},{"score":{"name":"$dev.difficulty","objective":"gm4_sr_data"},"color":"white"},{"text":" Health: ","color":"gray"},{"score":{"name":"$dev.health_curr","objective":"gm4_sr_data"},"color":"white"},{"text":"/","color":"white"},{"score":{"name":"$dev.health_max","objective":"gm4_sr_data"},"color":"white"},{"text":" Damage: "},{"score":{"name":"$dev.damage_10","objective":"gm4_sr_data"},"color":"white"},{"text":".","color":"white"},{"score":{"name":"$dev.damage_1","objective":"gm4_sr_data"},"color":"white"},{"text":" Speed: "},{"score":{"name":"$dev.speed","objective":"gm4_sr_data"},"color":"white"}]
