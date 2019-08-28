# @s = item that needs 1 removed from Count
# run from items in convert files

# store count in scoreboard
execute store result score @s gm4_mob_con_data run data get entity @s Item.Count
# remove 1
scoreboard players remove @s gm4_mob_con_data 1
# store back into nbt
execute store result entity @s Item.Count byte 1 run scoreboard players get @s gm4_mob_con_data

# Spigot fix
kill @s[scores={gm4_mob_con_data=0}]

# remove the tag
tag @s remove gm4_gapple