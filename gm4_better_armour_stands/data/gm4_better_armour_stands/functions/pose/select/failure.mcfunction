# @s = armor_stand to be modified
# at @s
# run from pose/select

title @p[tag=gm4_bas_active] actionbar {"text":"Right click the joint of a part to start editing","color":"gray"}

scoreboard players reset @s gm4_bas_id

playsound minecraft:entity.villager.no block @p[tag=gm4_bas_active] ~ ~ ~ .5 2

particle composter ~ ~.1 ~ 0 0 0 0 1

execute if score @s gm4_bas_data matches 0 run particle composter ~ ~1.6 ~ 0 0 0 0 1
execute if score @s gm4_bas_data matches 1 run particle composter ~ ~0.7 ~ 0 0 0 0 1

execute if score @s gm4_bas_data matches 0 run particle composter ~ ~1.3 ~ 0 0 0 0 1
execute if score @s gm4_bas_data matches 1 run particle composter ~ ~0.7 ~ 0 0 0 0 1

execute if score @s gm4_bas_data matches 0 positioned ~ ~1.4 ~ run particle composter ^.3 ^ ^ 0 0 0 0 1
execute if score @s gm4_bas_data matches 1 positioned ~ ~0.7 ~ run particle composter ^.15 ^ ^ 0 0 0 0 1

execute if score @s gm4_bas_data matches 0 positioned ~ ~1.4 ~ run particle composter ^-.3 ^ ^ 0 0 0 0 1
execute if score @s gm4_bas_data matches 1 positioned ~ ~0.7 ~ run particle composter ^-.15 ^ ^ 0 0 0 0 1

execute if score @s gm4_bas_data matches 0 positioned ~ ~0.8 ~ run particle composter ^.15 ^ ^ 0 0 0 0 1
execute if score @s gm4_bas_data matches 1 positioned ~ ~0.4 ~ run particle composter ^.05 ^ ^ 0 0 0 0 1

execute if score @s gm4_bas_data matches 0 positioned ~ ~0.8 ~ run particle composter ^-.15 ^ ^ 0 0 0 0 1
execute if score @s gm4_bas_data matches 1 positioned ~ ~0.4 ~ run particle composter ^-.05 ^ ^ 0 0 0 0 1
