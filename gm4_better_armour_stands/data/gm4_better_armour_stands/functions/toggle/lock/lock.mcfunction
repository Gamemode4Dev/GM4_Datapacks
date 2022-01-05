# @s = armor_stand
# at @s
# run from book/apply

data merge entity @s {Marker:1b,NoGravity:1b}
tag @s add gm4_bas_locked

particle minecraft:enchanted_hit ~ ~.5 ~ .15 .5 .15 0 5
playsound minecraft:block.chest.locked block @a[distance=..6] ~ ~ ~ 1 2

scoreboard players set $valid_code gm4_bas_data 1
