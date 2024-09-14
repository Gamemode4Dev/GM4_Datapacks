# remove paintbrush from horse if it is found
# @s = horse wearing a paintbrush as horse armor
# at unspecified
# run from main

loot spawn ~ ~1.6 ~ loot gm4_furniture:items/paintbrush
execute positioned ~ ~1.6 ~ run data modify entity @n[type=item,nbt={Item:{components:{"minecraft:custom_data":{gm4_furniture:paintbrush}}}},distance=..1] Item.components set from entity @s body_armor_item.components
item replace entity @s armor.body with air
