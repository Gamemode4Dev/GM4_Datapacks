# @s = armor_stand to be modified
# at @s
# run from apply_book

# toggle value
execute store result score @s gm4_bas_data run data get entity @s Invisible
scoreboard players add @s gm4_bas_data 1
execute unless score @s gm4_bas_data matches 0..1 run scoreboard players set @s gm4_bas_data 0

# set visibility
execute if score @s gm4_bas_data matches 0 run data modify entity @s Invisible set value 0
execute if score @s gm4_bas_data matches 1 run data modify entity @s Invisible set value 1
execute if score @s gm4_bas_data matches 1 run effect give @s glowing 2 0

playsound minecraft:entity.player.attack.nodamage neutral @a[distance=..5] ~ ~ ~ .5 .6
particle effect ~ ~ ~ .1 1 .1 0 10

advancement grant @p[tag=gm4_bas_active] only gm4:better_armour_stands
