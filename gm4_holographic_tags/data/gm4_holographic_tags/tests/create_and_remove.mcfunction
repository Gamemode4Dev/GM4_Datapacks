# @template gm4:test_platform
# @dummy ~1 ~1 ~

setblock ~1 ~1 ~2 gray_concrete

execute at @s run tp @s ~ ~ ~ facing ~ ~-1.5 ~2
item replace entity @s weapon.mainhand with item_frame
dummy @s use block ~1 ~1 ~2 north

item replace entity @s weapon.mainhand with minecraft:name_tag[custom_name='"HelloGamemode4"']
dummy @s use entity @e[type=item_frame,distance=..4,limit=1]

await not entity @e[type=item_frame,distance=..4]
clear @s written_book
assert entity @e[type=area_effect_cloud,distance=..4,name=HelloGamemode4]

execute at @s run tp @e[type=item,distance=..4] ~ ~ ~
await items entity @s weapon.mainhand minecraft:item_frame

dummy @s use block ~1 ~1 ~2 north

await not entity @e[type=area_effect_cloud,distance=..4]
assert items entity @e[type=item_frame,distance=..4] contents minecraft:name_tag[count=1,custom_name='"HelloGamemode4"']
