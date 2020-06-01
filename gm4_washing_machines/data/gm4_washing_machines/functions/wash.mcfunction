#@s = water tank with item in first slot 
#run from item_fill

#glass
execute if predicate gm4_washing_machines:glass run function gm4_washing_machines:washing_recipes/glass

#glass panes
execute if predicate gm4_washing_machines:glass_pane run function gm4_washing_machines:washing_recipes/glass_pane

#terracotta
execute if predicate gm4_washing_machines:terracotta run function gm4_washing_machines:washing_recipes/terracotta

#wool
execute if predicate gm4_washing_machines:wool run function gm4_washing_machines:washing_recipes/wool

#bed
execute if predicate gm4_washing_machines:bed run function gm4_washing_machines:washing_recipes/bed

#carpet
execute if predicate gm4_washing_machines:carpet run function gm4_washing_machines:washing_recipes/carpet

#map
execute if block ~ ~ ~ hopper{Items:[{Slot: 0b, id: "minecraft:filled_map"}]} run function gm4_washing_machines:washing_recipes/map

#leather armour
execute if predicate gm4_washing_machines:armour if data block ~ ~ ~ Items[0].tag.display.color run function gm4_washing_machines:washing_recipes/armour

#book
execute if block ~ ~ ~ hopper{Items:[{Slot: 0b, id: "minecraft:written_book"}]} run function gm4_washing_machines:washing_recipes/book