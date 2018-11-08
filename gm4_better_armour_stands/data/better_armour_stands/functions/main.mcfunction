execute as @e[type=item,nbt={Item:{id:"minecraft:writable_book"},OnGround:1b}] at @s if entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest] run function #better_armour_stands:apply_book
