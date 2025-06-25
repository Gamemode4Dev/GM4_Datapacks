
tag @s add gm4_horse.tamed

scoreboard players set @s gm4_horse_level 0
scoreboard players set @s gm4_horse_experience 6000
scoreboard players operation @s gm4_horse.stamina_cap = $need_cap.stamina_start gm4_horse_data
scoreboard players operation @s gm4_horse_need.stamina = @s gm4_horse.stamina_cap
scoreboard players operation @s gm4_horse_need.graze = $need_cap.graze gm4_horse_data
scoreboard players operation @s gm4_horse_need.brushing = $need_cap.brushing gm4_horse_data
scoreboard players operation @s gm4_horse_need.fed_treat = $need_cap.fed_treat gm4_horse_data
scoreboard players operation @s gm4_horse_need.on_leash = $need_cap.on_leash gm4_horse_data

attribute @s max_health modifier remove gm4_horse.untamed
