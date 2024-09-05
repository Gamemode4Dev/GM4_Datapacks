# @s = armor_stand to be modified
# at @s
# run from equip/offhand

loot spawn ~ ~1 ~ loot gm4_better_armour_stands:replaced_item
execute positioned ~ ~1 ~ run item replace entity @e[type=item,distance=..1,sort=nearest,limit=1,nbt={Item:{components:{"minecraft:custom_data":{gm4_better_armour_stands_replaced_item:1b}}}}] contents from entity @s weapon.offhand
item replace entity @s weapon.offhand with minecraft:air
