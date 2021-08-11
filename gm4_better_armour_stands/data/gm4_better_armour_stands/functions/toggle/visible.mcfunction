# @s = armor_stand
# at @s
# run from apply_book

# toggle value
execute store result score @s gm4_bas_data run data get entity @s Invisible
scoreboard players add @s gm4_bas_data 1
execute unless score @s gm4_bas_data matches 0..1 run scoreboard players set @s gm4_bas_data 0

# set visibility
execute if score @s gm4_bas_data matches 0 run data merge entity @s {Invisible:0b}
execute if score @s gm4_bas_data matches 1 run data merge entity @s {Invisible:1b}

playsound minecraft:entity.player.attack.nodamage neutral @a[distance=..5] ~ ~ ~ .5 .6
particle minecraft:cloud ~ ~ ~ .2 1 .2 0 5
