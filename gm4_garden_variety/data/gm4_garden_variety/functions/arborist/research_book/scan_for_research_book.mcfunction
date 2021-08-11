# TODO

execute store result score $slot gm4_gv_research run data get entity @s Inventory[{tag:{gm4_garden_variety:{research_book:{}}}}].Slot

data remove storage gm4_garden_variety:data/research Output
data modify storage gm4_garden_variety:data/research Output set from entity @s Inventory[{tag:{gm4_garden_variety:{research_book:{}}}}].tag.pages







