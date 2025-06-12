
tag @s add gm4_horse.tamed

scoreboard players set @s gm4_horse_level 0
scoreboard players set @s gm4_horse_experience 12
scoreboard players operation @s gm4_horse.stamina_cap = $need_cap.stamina_start gm4_horse_data
scoreboard players operation @s gm4_horse_need.stamina = @s gm4_horse.stamina_cap
scoreboard players operation @s gm4_horse_need.social = $need_cap.social gm4_horse_data
scoreboard players operation @s gm4_horse_need.graze = $need_cap.graze gm4_horse_data
scoreboard players operation @s gm4_horse_need.care = $need_cap.care gm4_horse_data
scoreboard players operation @s gm4_horse_need.brushing = $need_cap.brushing gm4_horse_data

attribute @s max_health modifier remove gm4_horse.untamed
