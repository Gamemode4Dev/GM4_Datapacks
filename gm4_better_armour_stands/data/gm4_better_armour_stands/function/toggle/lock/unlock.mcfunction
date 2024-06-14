# @s = armor_stand
# at @s
# run from book/apply

scoreboard players set $valid_code gm4_bas_data 1

# unlock armor_stand
data modify entity @s Glowing set value 0
playsound minecraft:block.wooden_trapdoor.open block @a[distance=..6] ~ ~ ~ 0.5 2
particle minecraft:enchant ~ ~.5 ~ .15 .5 .15 0 10

tag @s remove gm4_bas_locked
tag @s remove gm4_bas_temp_unlock
