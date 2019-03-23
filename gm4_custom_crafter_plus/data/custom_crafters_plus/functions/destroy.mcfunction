
# @s = @e[tag=gm4_craftingstand,type=armor_stand] at @s unless block ~ ~ ~ chest
# Run from main

kill @e[type=item,nbt={Item:{id:"minecraft:chest",tag:{display:{Name:"{\"text\":\"Custom Crafter +\"}"}}}}]
summon item ~ ~0.6 ~ {Item:{id:"minecraft:diamond_block",Count:1b}}
summon item ~ ~0.6 ~ {Item:{id:"minecraft:crafting_table",Count:1b}}
kill @s
