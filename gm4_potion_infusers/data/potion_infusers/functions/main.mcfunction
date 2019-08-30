#infusing effect
execute at @e[type=area_effect_cloud,tag=gm4_infusing,nbt=!{Age:80}] run function potion_infusers:effects/infusing

#tank process
execute as @e[type=armor_stand,tag=gm4_potion_infuser] at @s run function potion_infusers:process

execute as @e[type=area_effect_cloud,tag=gm4_infusing,nbt={Age:80}] at @s run function #potion_infusers:infusion
