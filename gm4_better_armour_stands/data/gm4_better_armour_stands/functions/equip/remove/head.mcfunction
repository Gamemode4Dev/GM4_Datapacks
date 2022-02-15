# @s = armor_stand to be modified
# at @s
# run from equip/head

loot spawn ~ ~1.5 ~ loot gm4_better_armour_stands:replaced_item
execute positioned ~ ~1.5 ~ run data modify entity @e[type=item,distance=..1,sort=nearest,limit=1] Item.id set from storage gm4_better_armour_stands:temp Item.id
item replace entity @s armor.head with air
