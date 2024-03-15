# @template gm4:test_platform
# @dummy ~1 ~1 ~

setblock ~1 ~1 ~2 gray_concrete

execute at @s run tp @s ~ ~ ~ facing ~ ~-1.5 ~2
give @s item_frame
dummy @s use block ~1 ~1 ~2 north

give @s name_tag{display:{Name:'"HelloGamemode4"'}}
dummy @s use entity @e[type=item_frame,distance=..4,limit=1]

await not entity @e[type=item_frame,distance=..4]
clear @s written_book
assert entity @e[type=area_effect_cloud,distance=..4,name=HelloGamemode4]

execute at @s run tp @e[type=item,distance=..4] ~ ~ ~
await entity @s[nbt={SelectedItem:{id:"minecraft:item_frame",Count:1b}}]

dummy @s use block ~1 ~1 ~2 north

await not entity @e[type=area_effect_cloud,distance=..4]
assert entity @e[type=item_frame,distance=..4,nbt={Item:{id:"minecraft:name_tag",Count:1b,tag:{display:{Name:'"HelloGamemode4"'}}}}]
