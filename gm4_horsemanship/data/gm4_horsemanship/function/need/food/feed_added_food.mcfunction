# check feeding the gm4_horse a food item added by this module
# @s = player feeding the gm4_horse
# at @s
# run from start_riding_horse

# check which item was fed
scoreboard players set $food_processed gm4_horse_data 0
item replace block 29999998 1 7134 container.0 from entity @s weapon.mainhand
data modify storage gm4_horsemanship:temp item_id set from block 29999998 1 7134 Items[{Slot:0b}].id
execute if score $food_processed gm4_horse_data matches 0 if data storage gm4_horsemanship:temp {item_id:"minecraft:short_grass"} on vehicle at @s run function gm4_horsemanship:need/food/type/short_grass
execute if score $food_processed gm4_horse_data matches 0 if data storage gm4_horsemanship:temp {item_id:"minecraft:sweet_berries"} on vehicle at @s run function gm4_horsemanship:need/food/type/sweet_berries
execute if score $food_processed gm4_horse_data matches 0 if data storage gm4_horsemanship:temp {item_id:"minecraft:glow_berries"} on vehicle at @s run function gm4_horsemanship:need/food/type/glow_berries
execute if score $food_processed gm4_horse_data matches 0 if data storage gm4_horsemanship:temp {item_id:"minecraft:chorus_fruit"} on vehicle at @s run function gm4_horsemanship:need/food/type/chorus_fruit
execute if score $food_processed gm4_horse_data matches 0 if data storage gm4_horsemanship:temp {item_id:"minecraft:dried_kelp"} on vehicle at @s run function gm4_horsemanship:need/food/type/dried_kelp
execute if score $food_processed gm4_horse_data matches 0 if data storage gm4_horsemanship:temp {item_id:"minecraft:melon_slice"} on vehicle at @s run function gm4_horsemanship:need/food/type/melon_slice
execute if score $food_processed gm4_horse_data matches 0 if data storage gm4_horsemanship:temp {item_id:"minecraft:beetroot"} on vehicle at @s run function gm4_horsemanship:need/food/type/beetroot
execute if score $food_processed gm4_horse_data matches 0 if data storage gm4_horsemanship:temp {item_id:"minecraft:bread"} on vehicle at @s run function gm4_horsemanship:need/food/type/bread
execute if score $food_processed gm4_horse_data matches 0 if data storage gm4_horsemanship:temp {item_id:"minecraft:baked_potato"} on vehicle at @s run function gm4_horsemanship:need/food/type/baked_potato
data remove storage gm4_horsemanship:temp item_id

# playsound and remove the fed item
execute on vehicle at @s run playsound entity.horse.eat neutral @a ~ ~ ~ 1 1
item modify entity @s[gamemode=!creative] weapon.mainhand {"function": "minecraft:set_count","count":-1,"add":true}

# restore player location
function gm4_horsemanship:riding/restore_location/prep
