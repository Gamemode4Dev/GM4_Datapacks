# @s = armor_stand to be modified
# at @s
# run from equip/head

loot spawn ~ ~1.5 ~ loot gm4_better_armour_stands:replaced_item
execute positioned ~ ~1.5 ~ run item replace entity @e[type=item,distance=..1,sort=nearest,limit=1,nbt={Item:{components:{"minecraft:custom_data":{gm4_better_armour_stands_replaced_item:1b}}}}] contents from entity @s armor.head
item replace entity @s armor.head with minecraft:air
