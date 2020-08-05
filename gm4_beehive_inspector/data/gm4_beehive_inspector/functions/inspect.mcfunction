# @s is a beehive item that was just mined
# runs from main

execute store result score #bees gm4_beehive_insp run data get entity @s Item.tag.BlockEntityTag.Bees
loot spawn ~ ~-1024 ~ loot gm4_beehive_inspector:lore

execute positioned ~ ~-1024 ~ run data modify entity @s Item.tag.display set from entity @e[type=item,distance=..0.1,limit=1] Item.tag.display
