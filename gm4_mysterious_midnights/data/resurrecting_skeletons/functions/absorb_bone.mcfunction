#@s = bone item on the ground
#at @s
#called by spawn_skeleton

#store count in scoreboard
execute store result score count gm4_reskelify run data get entity @s Item.Count
#remove 1
scoreboard players remove count gm4_reskelify 1
#store back into nbt
execute store result entity @s Item.Count byte 1 run scoreboard players get count gm4_reskelify
#Spigot fix
kill @s[scores={gm4_reskelify=0}]

#reset timer to 0
scoreboard players set @s gm4_reskelify 0
