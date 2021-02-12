execute as @e[type=item,nbt={Item:{id:"minecraft:writable_book"},OnGround:1b}] at @s if entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest] run function gm4_better_armour_stands:item
execute at @a[predicate=gm4_better_armour_stands:holding_book] run effect give @e[type=armor_stand,nbt={Invisible:1b},tag=!gm4_no_edit,distance=..8] glowing 2 0

schedule function gm4_better_armour_stands:main 16t
