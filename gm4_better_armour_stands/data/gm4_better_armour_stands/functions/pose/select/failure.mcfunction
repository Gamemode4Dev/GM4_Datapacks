# @s = armor_stand to be modified
# at @s
# run from pose/select

title @p[tag=gm4_bas_active] actionbar {"translate": "%1$s%3427655$s","with": ["Right click the joint of a part to start editing",{"translate": "tooltip.gm4.better_armour_stands.invalid_right_click_location"}]}

scoreboard players reset @s gm4_bas_id

playsound minecraft:entity.villager.no block @p[tag=gm4_bas_active] ~ ~ ~ .5 2

particle bubble_pop ~ ~.1 ~ 0 0 0 0 1

execute if score @s gm4_bas_data matches 0 run particle bubble_pop ~ ~1.6 ~ 0 0 0 0 1
execute if score @s gm4_bas_data matches 1 run particle bubble_pop ~ ~0.9 ~ 0 0 0 0 1

execute if score @s gm4_bas_data matches 0 run particle bubble_pop ~ ~1.3 ~ 0 0 0 0 1
execute if score @s gm4_bas_data matches 1 run particle bubble_pop ~ ~0.7 ~ 0 0 0 0 1

execute if score @s gm4_bas_data matches 0 positioned ~ ~1.4 ~ run particle bubble_pop ^.3 ^ ^ 0 0 0 0 1
execute if score @s gm4_bas_data matches 1 positioned ~ ~0.7 ~ run particle bubble_pop ^.15 ^ ^ 0 0 0 0 1

execute if score @s gm4_bas_data matches 0 positioned ~ ~1.4 ~ run particle bubble_pop ^-.3 ^ ^ 0 0 0 0 1
execute if score @s gm4_bas_data matches 1 positioned ~ ~0.7 ~ run particle bubble_pop ^-.15 ^ ^ 0 0 0 0 1

execute if score @s gm4_bas_data matches 0 positioned ~ ~0.8 ~ run particle bubble_pop ^.15 ^ ^ 0 0 0 0 1
execute if score @s gm4_bas_data matches 1 positioned ~ ~0.4 ~ run particle bubble_pop ^.05 ^ ^ 0 0 0 0 1

execute if score @s gm4_bas_data matches 0 positioned ~ ~0.8 ~ run particle bubble_pop ^-.15 ^ ^ 0 0 0 0 1
execute if score @s gm4_bas_data matches 1 positioned ~ ~0.4 ~ run particle bubble_pop ^-.05 ^ ^ 0 0 0 0 1
