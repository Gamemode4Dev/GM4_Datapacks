execute store result score $dev.difficulty gm4_ce_data run scoreboard players get @s gm4_ce_difficult.mob
execute store result score $dev.health gm4_ce_data run attribute @s generic.max_health get 1
execute store result score $dev.damage gm4_ce_data run attribute @s generic.attack_damage get 15
execute store result score $dev.speed gm4_ce_data run attribute @s generic.movement_speed get 100
execute store result score $dev.armor gm4_ce_data run attribute @s generic.armor get 1
execute store result score $dev.toughness gm4_ce_data run attribute @s generic.armor_toughness get 1
execute at @s run particle firework ~ ~1 ~ 0.2 0.5 0.2 0 3 force @p[tag=gm4_ce_dev]
title @p[tag=gm4_ce_dev] actionbar [{"text":"Diff: ","color":"gray"},{"score":{"name":"$dev.difficulty","objective":"gm4_ce_data"},"color":"white"},{"text":" Health: ","color":"gray"},{"score":{"name":"$dev.health","objective":"gm4_ce_data"},"color":"white"},{"text":" Damage: "},{"score":{"name":"$dev.damage","objective":"gm4_ce_data"},"color":"white"},{"text":" Speed: "},{"score":{"name":"$dev.speed","objective":"gm4_ce_data"},"color":"white"},{"text":" Armor: "},{"score":{"name":"$dev.armor","objective":"gm4_ce_data"},"color":"white"},{"text":" Toughness: "},{"score":{"name":"$dev.toughness","objective":"gm4_ce_data"},"color":"white"}]
