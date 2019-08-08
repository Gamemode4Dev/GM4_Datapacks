#run from hypexperia:main
#@s = experience orb that hasn't been doubled yet

execute store result entity @s Value short 2 run data get entity @s Value 1
particle totem_of_undying ~ ~0.2 ~ 0 0 0 0.2 10
playsound block.note_block.xylophone player @a ~ ~ ~ 0.1 0.3
tag @s add gm4_doubled_xp
