#infusing effect
execute at @e[type=area_effect_cloud,tag=gm4_infusing,nbt=!{Age:80}] run function potion_infusers:effects/infusing

#tank process
execute as @e[type=armor_stand,tag=gm4_liquid_tank] if score @s gm4_lt_value matches 1.. at @s run function potion_infusers:infusion_check

execute as @e[type=area_effect_cloud,tag=gm4_infusing,nbt={Age:80}] at @s run function #potion_infusers:infusion
