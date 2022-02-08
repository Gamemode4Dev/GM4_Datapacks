# @s = armor_stand to be modified
# at @s
# run from book/apply

scoreboard players set $valid_code gm4_bas_data 1

# toggle gravity
execute store result score $gravity gm4_bas_data run data get entity @s NoGravity
playsound minecraft:item.chorus_fruit.teleport block @a[distance=..6] ~ ~ ~ 0.5 2

execute if score $gravity gm4_bas_data matches 0 run data modify entity @s NoGravity set value 1
execute if score $gravity gm4_bas_data matches 0 run particle minecraft:reverse_portal ~ ~ ~ .2 1 .2 0 20

execute if score $gravity gm4_bas_data matches 1 run data modify entity @s NoGravity set value 0
execute if score $gravity gm4_bas_data matches 1 run particle minecraft:portal ~ ~ ~ .2 1 .2 0 20

# advancement for customizing armor_stand
advancement grant @a[tag=gm4_bas_active,limit=1] only gm4:better_armour_stands
