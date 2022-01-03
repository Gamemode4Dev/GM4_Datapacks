# @s = armor_stand
# at @s
# run from book/apply

execute store result score @s gm4_bas_data if entity @s[tag=gm4_bas_locked]

# lock
execute unless score @s gm4_bas_data matches 1 run tag @s add gm4_bas_locked
execute unless score @s gm4_bas_data matches 1 run tag @s add gm4_bas_temp_unlock
execute unless score @s gm4_bas_data matches 1 run data modify entity @s NoGravity set value 1

# unlock
execute if score @s gm4_bas_data matches 1 run tag @s remove gm4_bas_locked
execute if score @s gm4_bas_data matches 1 run tag @s remove gm4_bas_temp_unlock

particle minecraft:enchanted_hit ~ ~.5 ~ .15 .5 .15 0 5
playsound minecraft:block.chest.locked block @a[distance=..6] ~ ~ ~ 1 2

scoreboard players set $valid_code gm4_bas_data 1
