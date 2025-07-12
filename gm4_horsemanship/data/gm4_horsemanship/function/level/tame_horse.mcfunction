
tag @s add gm4_horse.tamed

scoreboard players set @s gm4_horse_level 0
scoreboard players set @s gm4_horse_experience 6000
scoreboard players operation @s gm4_horse.stamina_cap = $need_cap.stamina_start gm4_horse_data
scoreboard players operation @s gm4_horse_need.stamina = @s gm4_horse.stamina_cap
scoreboard players operation @s gm4_horse_need.graze = $need_cap.graze gm4_horse_data
scoreboard players operation @s gm4_horse_need.brushing = $need_cap.brushing gm4_horse_data
scoreboard players operation @s gm4_horse_need.fed_treat = $need_cap.fed_treat gm4_horse_data
scoreboard players operation @s gm4_horse_need.on_leash = $need_cap.on_leash gm4_horse_data

# starting XP boost for Foals
scoreboard players operation @s gm4_horse_potential.foal /= #30 gm4_horse_data
scoreboard players operation @s gm4_horse_potential.foal < #1125 gm4_horse_data
scoreboard players operation @s gm4_horse_potential.foal *= #100 gm4_horse_data
execute if score @s gm4_horse_potential.foal matches 1.. run function gm4_horsemanship:level/convert_foal_xp

# starting Potential
scoreboard players set @s gm4_horse_potential.total 375
scoreboard players set @s gm4_horse_potential.realized 37500

# remove wild horse health boost
attribute @s max_health modifier remove gm4_horse.untamed
