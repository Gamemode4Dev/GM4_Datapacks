# remove paintbrush from horse if it is found
# @s = horse wearing a paintbrush as horse armor
# at unspecified
# run from main

data modify storage gm4_furniture:temp paintbrush_data set from entity @s ArmorItems[2].tag
loot spawn ~ ~1.6 ~ loot gm4_furniture:technical/drop_horse_paintbrush
item replace entity @s horse.armor with air
data remove storage gm4_furniture:temp paintbrush_data
