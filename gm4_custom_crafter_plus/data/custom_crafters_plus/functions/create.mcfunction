# @s = @e[type=item,nbt={Item:{id:"minecraft:diamond_block"}}] at @s if block ~ ~-0.3 ~ crafting_table
# Run from main


setblock ~ ~-1 ~ minecraft:chest{CustomName:"{\"text\":\"Custom Crafter +\"}"}
execute as @s at @s align xyz positioned ~0.5 ~ ~0.5 run summon armor_stand ~ ~-1 ~ {ArmorItems:[{},{},{},{id:"crafting_table",Count:1}],DisabledSlots:2039552,NoGravity:1b,Invulnerable:1b,Small:1b,Invisible:1b,PersistenceRequired:1b,Glowing:0b,Tags:["gm4_no_edit","gm4_craftingstand"]}
kill @s
