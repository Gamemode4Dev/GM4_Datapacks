# @s = armor_stand to be modified
# at @s
# run from book/apply

# get current value
execute store result score @s gm4_bas_data run data get entity @s NoGravity

# set gravity
execute if score @s gm4_bas_data matches 1 run data modify entity @s NoGravity set value 0
execute if score @s gm4_bas_data matches 1 run particle minecraft:portal ~ ~ ~ .2 1 .2 0 20

# remove gravity
execute unless score @s gm4_bas_data matches 1 run data modify entity @s NoGravity set value 1
execute unless score @s gm4_bas_data matches 1 run particle minecraft:reverse_portal ~ ~ ~ .2 1 .2 0 20

playsound minecraft:entity.fox.teleport block @a[distance=..5] ~ ~ ~ .5 1.5

tag @s add gm4_bas_valid_code
advancement grant @a[tag=gm4_bas_active,limit=1] only gm4:better_armour_stands
