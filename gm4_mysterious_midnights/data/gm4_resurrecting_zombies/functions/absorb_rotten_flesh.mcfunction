#@s = rotten_flesh item on the ground
#at @s
#called by spawn_zombie

#remove 1 from count of rotten flesh stack
execute store result score count gm4_rezombify run data get entity @s Item.Count 0.99
execute store result entity @s Item.Count byte 1 run scoreboard players get count gm4_rezombify
#Spigot fix
execute if score count gm4_rezombify matches 0 run kill @s

#reset timer to 0
scoreboard players set @s gm4_rezombify 0
