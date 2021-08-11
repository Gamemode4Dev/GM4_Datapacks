# @s = armor_stand
# at @s
# run from apply_book

# toggle value
execute store result score @s gm4_bas_data run data get entity @s NoGravity
scoreboard players add @s gm4_bas_data 1
execute unless score @s gm4_bas_data matches 0..1 run scoreboard players set @s gm4_bas_data 0

playsound minecraft:entity.fox.teleport master @a[distance=..5] ~ ~ ~ .5 1.5

# set gravity
execute if score @s gm4_bas_data matches 0 run data merge entity @s {NoGravity:0b}
execute if score @s gm4_bas_data matches 0 run particle minecraft:portal ~ ~ ~ .2 1 .2 0 20

# remove gravity
execute if score @s gm4_bas_data matches 1 run data merge entity @s {NoGravity:1b}
execute if score @s gm4_bas_data matches 1 run particle minecraft:reverse_portal ~ ~ ~ .2 1 .2 0 20
