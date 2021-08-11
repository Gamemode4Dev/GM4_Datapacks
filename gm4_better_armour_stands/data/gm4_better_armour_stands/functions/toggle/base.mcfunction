# @s = armor_stand
# at @s
# run from apply_book

# toggle value
execute store result score @s gm4_bas_data run data get entity @s NoBasePlate
scoreboard players add @s gm4_bas_data 1
execute unless score @s gm4_bas_data matches 0..1 run scoreboard players set @s gm4_bas_data 0

# set base plate
execute if score @s gm4_bas_data matches 0 run data merge entity @s {NoBasePlate:0b}
execute if score @s gm4_bas_data matches 0 run playsound minecraft:block.stone.place block @a[distance=..5] ~ ~ ~ 0.5 1

# remove base plate
execute if score @s gm4_bas_data matches 1 run data merge entity @s {NoBasePlate:1b}
execute if score @s gm4_bas_data matches 1 run playsound minecraft:block.stone.break block @a[distance=..5] ~ ~ ~ 0.5 1
execute if score @s gm4_bas_data matches 1 run particle minecraft:block smooth_stone ~ ~ ~ .15 0 .15 0 10
