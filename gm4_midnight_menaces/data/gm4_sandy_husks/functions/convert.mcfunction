# @s = zombies with nbt={PersistenceRequired:0b}
# at @s
# called by event

tag @s add gm4_sandy_husk_checked

#calculate probability
execute store result score @s gm4_menace_data run data get entity @s UUID[0]
scoreboard players operation @s gm4_menace_data %= 100 gm4_menace_data

execute if score @s gm4_menace_data matches 50.. run function gm4_sandy_husks:husk_transform
