execute as @e[type=item,nbt={Item:{id:"minecraft:writable_book"}}] at @s if entity @e[type=armor_stand,distance=..1] run function #better_armor_stands:update
