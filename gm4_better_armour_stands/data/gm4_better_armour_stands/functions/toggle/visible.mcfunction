# @s = armor_stand to be modified
# at @s
# run from book/apply

# get current value
execute store result score @s gm4_bas_data run data get entity @s Invisible

# set visibile
execute if score @s gm4_bas_data matches 1 run data modify entity @s Invisible set value 0
execute if score @s gm4_bas_data matches 1 run effect clear @s glowing

# set invisibile
execute unless score @s gm4_bas_data matches 1 run data modify entity @s Invisible set value 1
execute unless score @s gm4_bas_data matches 1 run effect give @s glowing 2 0

playsound minecraft:entity.player.attack.nodamage neutral @a[distance=..5] ~ ~ ~ .5 .6

tag @s add gm4_bas_valid_code
advancement grant @a[tag=gm4_bas_active,limit=1] only gm4:better_armour_stands
