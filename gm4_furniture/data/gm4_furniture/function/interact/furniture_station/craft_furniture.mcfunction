# player furniture crafting sound
# @s = furniture's interacted interaction entity
# at @s
advancement revoke @s only gm4_furniture:crafted_furniture

execute store result score $current_time gm4_furniture_data run time query gametime 
execute as @a[distance=..16] unless score @s gm4_furniture_craft_sound_time = $current_time gm4_furniture_data run playsound minecraft:entity.villager.work_fletcher block @s ~ ~ ~ 1 1.25
execute as @a[distance=..16] run scoreboard players operation @s gm4_furniture_craft_sound_time = $current_time gm4_furniture_data
