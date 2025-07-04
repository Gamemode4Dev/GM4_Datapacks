#@s = water tank liquid_tank_stand with item in first slot
#run from item_fill

# Copy item to armor stand offhand 
data modify entity @s equipment.offhand merge value {id:"minecraft:stick",count:1}
data modify entity @s equipment.offhand.id set from storage gm4_liquid_tanks:temp/tank input_slot.id

execute if predicate gm4_washing_tanks:harness as @e[type=marker,tag=gm4_liquid_tank,distance=..0.6,limit=1] run function gm4_washing_tanks:washing_recipes/harness
execute if predicate gm4_washing_tanks:glass as @e[type=marker,tag=gm4_liquid_tank,distance=..0.6,limit=1] run function gm4_washing_tanks:washing_recipes/glass
execute if predicate gm4_washing_tanks:glass_pane as @e[type=marker,tag=gm4_liquid_tank,distance=..0.6,limit=1] run function gm4_washing_tanks:washing_recipes/glass_pane
execute if predicate gm4_washing_tanks:terracotta as @e[type=marker,tag=gm4_liquid_tank,distance=..0.6,limit=1] run function gm4_washing_tanks:washing_recipes/terracotta
execute if predicate gm4_washing_tanks:wool as @e[type=marker,tag=gm4_liquid_tank,distance=..0.6,limit=1] run function gm4_washing_tanks:washing_recipes/wool
execute if predicate gm4_washing_tanks:bed as @e[type=marker,tag=gm4_liquid_tank,distance=..0.6,limit=1] run function gm4_washing_tanks:washing_recipes/bed
execute if predicate gm4_washing_tanks:carpet as @e[type=marker,tag=gm4_liquid_tank,distance=..0.6,limit=1] run function gm4_washing_tanks:washing_recipes/carpet
execute if predicate gm4_washing_tanks:armour if data storage gm4_liquid_tanks:temp/tank input_slot.components."minecraft:dyed_color" as @e[type=marker,tag=gm4_liquid_tank,distance=..0.6,limit=1] run function gm4_washing_tanks:washing_recipes/armour
execute if predicate gm4_washing_tanks:shulker_box as @e[type=marker,tag=gm4_liquid_tank,distance=..0.6,limit=1] run function gm4_washing_tanks:washing_recipes/shulker_box

# Clear armor stand offhand
data remove entity @s equipment.offhand
