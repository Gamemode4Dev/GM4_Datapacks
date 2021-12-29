# @s = armor_stand to be modified
# at @s
# run from book/apply

# get current value
execute store result score @s gm4_bas_data run data get entity @s NoBasePlate

# set base plate
execute if score @s gm4_bas_data matches 1 run data modify entity @s NoBasePlate set value 0
execute if score @s gm4_bas_data matches 1 run playsound minecraft:block.stone.place block @a[distance=..6] ~ ~ ~ 0.5 1

# remove base plate
execute unless score @s gm4_bas_data matches 1 run data modify entity @s NoBasePlate set value 1
execute unless score @s gm4_bas_data matches 1 run playsound minecraft:block.stone.break block @a[distance=..6] ~ ~ ~ 0.5 1
execute unless score @s gm4_bas_data matches 1 run particle minecraft:block smooth_stone ~ ~ ~ .15 0 .15 0 10

tag @s add gm4_bas_valid_code
advancement grant @a[tag=gm4_bas_active,limit=1] only gm4:better_armour_stands
