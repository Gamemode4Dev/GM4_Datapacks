# @s = slimeball item on the ground
# at @s
# called by spawn_slime

# remove 1 from count of slimeball stack
execute store result score count gm4_reslimify run data get entity @s Item.Count 0.99
execute store result entity @s Item.Count byte 1 run scoreboard players get count gm4_reslimify
# Spigot fix
execute if score count gm4_reslimify matches 0 run kill @s

# reset timer to 0
scoreboard players set @s gm4_reslimify 0
