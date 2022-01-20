# @s = armor_stand to be modified
# at @s
# run from book/apply

scoreboard players set $valid_code gm4_bas_data 1

# toggle base plate
execute store result score $base gm4_bas_data run data get entity @s NoBasePlate

execute if score $base gm4_bas_data matches 0 run data modify entity @s NoBasePlate set value 1
execute if score $base gm4_bas_data matches 0 run playsound minecraft:block.stone.break block @a[distance=..6] ~ ~ ~ 0.5 1
execute if score $base gm4_bas_data matches 0 run particle minecraft:block smooth_stone ~ ~ ~ .15 0 .15 0 10

execute if score $base gm4_bas_data matches 1 run data modify entity @s NoBasePlate set value 0
execute if score $base gm4_bas_data matches 1 run playsound minecraft:block.stone.place block @a[distance=..6] ~ ~ ~ 0.5 1

# advancement for customizing armor_stand
advancement grant @a[tag=gm4_bas_active,limit=1] only gm4:better_armour_stands
