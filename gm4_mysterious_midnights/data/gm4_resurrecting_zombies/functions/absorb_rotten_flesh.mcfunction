#@s = bone item on the ground
#at @s
#called by spawn_zombie

#store count in scoreboard
execute store result score count gm4_rezombify run data get entity @s Item.Count
#remove 1
scoreboard players remove count gm4_rezombify 1
#store back into nbt
execute store result entity @s Item.Count byte 1 run scoreboard players get count gm4_rezombify
#Spigot fix
execute if score count gm4_rezombify matches 0 run kill @s

#reset timer to 0
scoreboard players set @s gm4_rezombify 0
