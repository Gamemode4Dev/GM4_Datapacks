# @s = armor_stand to be modified
# at @s
# run from book/apply

# get current value
execute store result score @s gm4_bas_data run data get entity @s Small

# tall
execute if score @s gm4_bas_data matches 1 run data modify entity @s Small set value 0
execute if score @s gm4_bas_data matches 1 run playsound minecraft:entity.puffer_fish.blow_up block @a[distance=..6] ~ ~ ~ .5 1.5

# small
execute unless score @s gm4_bas_data matches 1 run data modify entity @s Small set value 1
execute unless score @s gm4_bas_data matches 1 run playsound minecraft:entity.puffer_fish.blow_out block @a[distance=..6] ~ ~ ~ .5 1.5

playsound minecraft:entity.armor_stand.fall block @a[distance=..6] ~ ~ ~ 0.5 1

scoreboard players set $valid_code gm4_bas_data 1
advancement grant @a[tag=gm4_bas_active,limit=1] only gm4:better_armour_stands
