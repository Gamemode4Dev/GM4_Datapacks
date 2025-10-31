
tag @s add gm4_horse.tamed

scoreboard players set @s gm4_horse.level 0
scoreboard players set @s gm4_horse.experience_to_level 60
scoreboard players set @s gm4_horse.stamina_cap 75
scoreboard players operation @s gm4_horse.stamina = @s gm4_horse.stamina_cap

# remove wild horse boost
attribute @s max_health modifier remove gm4_horse.untamed
attribute @s movement_speed modifier remove gm4_horse.untamed
