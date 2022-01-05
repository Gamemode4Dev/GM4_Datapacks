# @s = armor_stand
# at @s
# run from book/apply

data modify entity @s Glowing set value 0
tag @s remove gm4_bas_locked
tag @s remove gm4_bas_temp_unlock

particle minecraft:enchanted_hit ~ ~.5 ~ .15 .5 .15 0 5
playsound minecraft:block.chest.locked block @a[distance=..6] ~ ~ ~ 1 2

scoreboard players set $valid_code gm4_bas_data 1
