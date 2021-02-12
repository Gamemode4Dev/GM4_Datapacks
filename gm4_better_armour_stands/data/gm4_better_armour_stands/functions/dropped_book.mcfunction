data modify storage gm4_better_armour_stands:data pages set from entity @s Item.tag.pages
execute as @e[type=armor_stand,distance=..1,limit=1,sort=nearest] at @s run function #gm4_better_armour_stands:apply_book
