#@s = water tank with item in first slot
#run from item_fill

# Copy item to armor stand offhand 
data modify entity @s HandItems[1] merge value {id:"minecraft:stick",Count:1b}
data modify entity @s HandItems[1].id set from block ~ ~ ~ Items[0].id

execute if predicate gm4_washing_tanks:glass run function gm4_washing_tanks:washing_recipes/glass
execute if predicate gm4_washing_tanks:glass_pane run function gm4_washing_tanks:washing_recipes/glass_pane
execute if predicate gm4_washing_tanks:terracotta run function gm4_washing_tanks:washing_recipes/terracotta
execute if predicate gm4_washing_tanks:wool run function gm4_washing_tanks:washing_recipes/wool
execute if predicate gm4_washing_tanks:bed run function gm4_washing_tanks:washing_recipes/bed
execute if predicate gm4_washing_tanks:carpet run function gm4_washing_tanks:washing_recipes/carpet
execute if predicate gm4_washing_tanks:armour if data block ~ ~ ~ Items[0].tag.display.color run function gm4_washing_tanks:washing_recipes/armour
execute if predicate gm4_washing_tanks:shulker_box run function gm4_washing_tanks:washing_recipes/shulker_box

# Clear armor stand offhand
data modify entity @s HandItems[1] set value {}
