#@s = zombies with nbt={PersistenceRequired:0b}
#at @s
#called by event

tag @s add gm4_sandy_husk

#calculate probability
execute store result score @s gm4_menace run data get entity @s UUIDMost 0.00000000023283064365386962890625
scoreboard players operation @s gm4_menace %= 100 gm4_menace

execute if score @s gm4_menace matches 50.. run function gm4_sandy_husks:husk_transform

execute if score @s gm4_menace matches ..49 run scoreboard players reset @s
