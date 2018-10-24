#@s = @e[type=armor_stand,tag=gm4_custom_crafter] at @s unless block ~ ~ ~ air

execute as @e[type=item,distance=..1,nbt={Item:{id:"minecraft:dropper",tag:{display:{Name:"{\"text\":\"Custom Crafter\"}"}},Count:1b}}] run data remove entity @s Item.tag.display.Name
summon item ~ ~.6 ~ {Item:{id:"redstone",Count:1b},Passengers:[{id:"item",Item:{id:"cobblestone",Count:7}},{id:"item",Item:{id:"crafting_table",Count:1,tag:{display:{Lore:["slightly damaged workbench"]}}}}]}
particle block crafting_table ~ ~1 ~ .1 .25 .1 .05 30 normal @a
kill @s
