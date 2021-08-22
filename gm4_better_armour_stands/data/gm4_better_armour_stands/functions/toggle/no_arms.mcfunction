# @s = armor_stand to be modified
# at @s
# run from apply_book

data modify entity @s ShowArms set value 0

execute store result score @s gm4_bas_data run data get entity @s Small

# normal size
execute if score @s gm4_bas_data matches 0 positioned ~ ~1.4 ~ run particle block oak_planks ^.35 ^ ^ 0 0 0 0 4
execute if score @s gm4_bas_data matches 0 positioned ~ ~1.4 ~ run particle block oak_planks ^-.35 ^ ^ 0 0 0 0 4

# small size
execute if score @s gm4_bas_data matches 1 positioned ~ ~.7 ~ run particle block oak_planks ^.2 ^ ^ 0 0 0 0 4
execute if score @s gm4_bas_data matches 1 positioned ~ ~.7 ~ run particle block oak_planks ^-.2 ^ ^ 0 0 0 0 4

playsound minecraft:entity.armor_stand.break block @a[distance=..5] ~ ~ ~ 0.5 1

tag @s add gm4_bas_modified
advancement grant @p[tag=gm4_bas_active] only gm4:better_armour_stands
