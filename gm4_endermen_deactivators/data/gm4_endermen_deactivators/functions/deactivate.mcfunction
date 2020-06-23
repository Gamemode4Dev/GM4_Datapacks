#@s formerly live endermen_deactivator
#from endermen_deactivator_live

#deactivate
data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1,Damage:3,tag:{CustomModelData:23,SkullOwner:{Id:"2ce3d7a7-5bc7-48bf-a7b9-28a4159377bb",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNjc1Y2Y1MTIxMjg5Y2I4Y2QxZjA5NmFhMTdmZDkxZGFlNzQ2OGMzM2VjYzU2NDlmNjA0ZDk4MWIxZDZkMjhlNSJ9fX0="}]}}}}]}
scoreboard players reset @s gm4_end_deact
tag @s remove gm4_end_deact_live
tag @s add gm4_end_deact_dead

#flair
playsound block.conduit.attack.target block @a[distance=..16] ~ ~ ~ .8 1