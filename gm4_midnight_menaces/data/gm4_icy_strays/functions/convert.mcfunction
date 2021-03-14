#@s = skeletons with nbt={HandItems:[{id:"minecraft:bow",Count:1b},{}],PersistenceRequired:0b}
#at @s
#called by event

tag @s add gm4_icy_stray_checked

#calculate probability
execute store result score @s gm4_menace_data run data get entity @s UUID[0]
scoreboard players operation @s gm4_menace_data %= 100 gm4_menace_data

execute if score @s gm4_menace_data matches 50.. run function gm4_icy_strays:stray_transform
