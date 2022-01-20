# @s = armor_stand
# at @s
# run from book/apply

scoreboard players set $valid_code gm4_bas_data 1

# lock armor_stand
data merge entity @s {Marker:1b,NoGravity:1b}
playsound minecraft:block.wooden_trapdoor.close block @a[distance=..6] ~ ~ ~ 0.5 2
particle minecraft:enchant ~ ~.5 ~ .15 .5 .15 .3 10

tag @s add gm4_bas_locked
