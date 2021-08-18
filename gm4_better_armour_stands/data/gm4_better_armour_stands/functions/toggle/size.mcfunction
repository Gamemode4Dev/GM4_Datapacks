# @s = armor_stand to be modified
# at @s
# run from apply_book

# toggle value
execute store result score @s gm4_bas_data run data get entity @s Small
scoreboard players add @s gm4_bas_data 1
execute unless score @s gm4_bas_data matches 0..1 run scoreboard players set @s gm4_bas_data 0

playsound minecraft:entity.armor_stand.fall block @a[distance=..5] ~ ~ ~ 0.5 1

# tall
execute if score @s gm4_bas_data matches 0 run data modify entity @s Small set value 0
execute if score @s gm4_bas_data matches 0 run playsound minecraft:entity.puffer_fish.blow_up block @a[distance=..5] ~ ~ ~ .5 1.5

# small
execute if score @s gm4_bas_data matches 1 run data modify entity @s Small set value 1
execute if score @s gm4_bas_data matches 1 run playsound minecraft:entity.puffer_fish.blow_out block @a[distance=..5] ~ ~ ~ .5 1.5

advancement grant @p[tag=gm4_bas_active] only gm4:better_armour_stands
