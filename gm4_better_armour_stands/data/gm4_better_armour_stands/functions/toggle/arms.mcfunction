# @s = armor_stand
# at @s
# run from apply_book

execute store result score @s gm4_bas_data run data get entity @s Small
data merge entity @s {ShowArms:0b}
playsound minecraft:entity.armor_stand.break block @a[distance=..5] ~ ~ ~ 0.5 1

# normal size
execute if score @s gm4_bas_data matches 0 positioned ~ ~1.4 ~ run particle block oak_planks ^.35 ^ ^ 0 0 0 0 4
execute if score @s gm4_bas_data matches 0 positioned ~ ~1.4 ~ run particle block oak_planks ^-.35 ^ ^ 0 0 0 0 4

# small size
execute if score @s gm4_bas_data matches 1 positioned ~ ~.7 ~ run particle block oak_planks ^.2 ^ ^ 0 0 0 0 4
execute if score @s gm4_bas_data matches 1 positioned ~ ~.7 ~ run particle block oak_planks ^-.2 ^ ^ 0 0 0 0 4
