# @s = armor_stand to be modified
# at @s
# run from pose/select

title @a[tag=gm4_bas_active,limit=1] actionbar {"translate": "%1$s%3427655$s","with": ["Right click the joint of a part to start editing",{"translate": "tooltip.gm4.better_armour_stands.invalid_right_click_location"}]}

scoreboard players reset @s gm4_bas_id

playsound minecraft:entity.villager.no block @a[tag=gm4_bas_active,limit=1] ~ ~ ~ 0.5 2

particle electric_spark ~ ~.1 ~ 0 0 0 0 1

execute if score $size gm4_bas_data matches 0 run particle electric_spark ~ ~1.6 ~ 0 0 0 0 1
execute if score $size gm4_bas_data matches 1 run particle electric_spark ~ ~0.9 ~ 0 0 0 0 1

execute if score $size gm4_bas_data matches 0 run particle electric_spark ~ ~1.3 ~ 0 0 0 0 1
execute if score $size gm4_bas_data matches 1 run particle electric_spark ~ ~0.7 ~ 0 0 0 0 1

execute if score $size gm4_bas_data matches 0 positioned ~ ~1.4 ~ run particle electric_spark ^.3 ^ ^ 0 0 0 0 1
execute if score $size gm4_bas_data matches 1 positioned ~ ~0.7 ~ run particle electric_spark ^.15 ^ ^ 0 0 0 0 1

execute if score $size gm4_bas_data matches 0 positioned ~ ~1.4 ~ run particle electric_spark ^-.3 ^ ^ 0 0 0 0 1
execute if score $size gm4_bas_data matches 1 positioned ~ ~0.7 ~ run particle electric_spark ^-.15 ^ ^ 0 0 0 0 1

execute if score $size gm4_bas_data matches 0 positioned ~ ~0.8 ~ run particle electric_spark ^.15 ^ ^ 0 0 0 0 1
execute if score $size gm4_bas_data matches 1 positioned ~ ~0.4 ~ run particle electric_spark ^.05 ^ ^ 0 0 0 0 1

execute if score $size gm4_bas_data matches 0 positioned ~ ~0.8 ~ run particle electric_spark ^-.15 ^ ^ 0 0 0 0 1
execute if score $size gm4_bas_data matches 1 positioned ~ ~0.4 ~ run particle electric_spark ^-.05 ^ ^ 0 0 0 0 1
