# @s = armor_stand to be modified
# at @s
# run from book/apply

scoreboard players set $valid_code gm4_bas_data 1

# toggle arms
execute store result score $arms gm4_bas_data run data get entity @s ShowArms

execute if score $arms gm4_bas_data matches 0 run data modify entity @s ShowArms set value 1
execute if score $arms gm4_bas_data matches 0 run playsound minecraft:entity.armor_stand.place block @a[distance=..6] ~ ~ ~ 0.5 1.5

execute if score $arms gm4_bas_data matches 1 run data modify entity @s ShowArms set value 0
execute if score $arms gm4_bas_data matches 1 run playsound minecraft:entity.armor_stand.break block @a[distance=..6] ~ ~ ~ 0.5 1.5
execute if score $arms gm4_bas_data matches 1 run function gm4_better_armour_stands:toggle/arms/detect_interaction

# check size and show particles
execute store result score $size gm4_bas_data run data get entity @s Small

execute if score $size gm4_bas_data matches 0 positioned ~ ~1.4 ~ run particle block oak_planks ^.35 ^ ^ 0 0 0 0 4
execute if score $size gm4_bas_data matches 0 positioned ~ ~1.4 ~ run particle block oak_planks ^-.35 ^ ^ 0 0 0 0 4

execute if score $size gm4_bas_data matches 1 positioned ~ ~.7 ~ run particle block oak_planks ^.2 ^ ^ 0 0 0 0 4
execute if score $size gm4_bas_data matches 1 positioned ~ ~.7 ~ run particle block oak_planks ^-.2 ^ ^ 0 0 0 0 4

# advancement for customizing armor_stand
advancement grant @a[tag=gm4_bas_active,limit=1] only gm4:better_armour_stands
