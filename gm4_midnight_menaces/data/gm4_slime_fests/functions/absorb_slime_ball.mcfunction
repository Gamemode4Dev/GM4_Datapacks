#@s = slimeball item on the ground
#at @s
#called by spawn_slime

#store count in scoreboard
execute store result score count gm4_reslimify run data get entity @s Item.Count
#remove 1
scoreboard players remove count gm4_reslimify 1
#store back into nbt
execute store result entity @s Item.Count byte 1 run scoreboard players get count gm4_reslimify

#reset timer to 0
scoreboard players set @s gm4_reslimify 0
