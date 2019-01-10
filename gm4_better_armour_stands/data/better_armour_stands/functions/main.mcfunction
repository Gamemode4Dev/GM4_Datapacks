execute as @e[type=item,nbt={Item:{id:"minecraft:writable_book"},OnGround:1b}] at @s if entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest] run function #better_armour_stands:apply_book
execute at @a[nbt={SelectedItem:{id:"minecraft:writable_book",tag:{pages:[""]}}}] run effect give @e[type=armor_stand,scores={gm4_particle=1..},distance=..8] glowing 2 0
