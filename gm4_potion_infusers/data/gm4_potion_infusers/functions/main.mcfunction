#infusing effect
execute at @e[type=area_effect_cloud,tag=gm4_infusing,nbt=!{Age:80}] run function gm4_potion_infusers:effects/infusing

#tank process
execute as @e[type=armor_stand,tag=gm4_potion_infuser] at @s run function gm4_potion_infusers:process

execute as @e[type=area_effect_cloud,tag=gm4_infusing,nbt={Age:80}] at @s run function #gm4_potion_infusers:infusion

schedule function gm4_potion_infusers:main 16t