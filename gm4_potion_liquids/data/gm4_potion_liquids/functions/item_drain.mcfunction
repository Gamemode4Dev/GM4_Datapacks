#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

#night_vision
execute if score @s[tag=gm4_lt_night_vision] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:night_vision"}}]} run function gm4_potion_liquids:item_drain/potion

execute if score @s[tag=gm4_lt_night_vision] gm4_lt_value matches ..297 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:long_night_vision"}}]} run function gm4_potion_liquids:item_drain/long_potion

#invisibility
execute if score @s[tag=gm4_lt_invisibility] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:invisibility"}}]} run function gm4_potion_liquids:item_drain/potion

execute if score @s[tag=gm4_lt_invisibility] gm4_lt_value matches ..297 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:long_invisibility"}}]} run function gm4_potion_liquids:item_drain/long_potion

#leaping
execute if score @s[tag=gm4_lt_leaping] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:leaping"}}]} run function gm4_potion_liquids:item_drain/potion

execute if score @s[tag=gm4_lt_leaping] gm4_lt_value matches ..297 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:long_leaping"}}]} run function gm4_potion_liquids:item_drain/long_potion

#strong leaping
execute if score @s[tag=gm4_lt_strong_leaping] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:strong_leaping"}}]} run function gm4_potion_liquids:item_drain/potion

#fire resistance
execute if score @s[tag=gm4_lt_fire_resistance] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:fire_resistance"}}]} run function gm4_potion_liquids:item_drain/potion

execute if score @s[tag=gm4_lt_fire_resistance] gm4_lt_value matches ..297 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:long_fire_resistance"}}]} run function gm4_potion_liquids:item_drain/long_potion

#swiftness
execute if score @s[tag=gm4_lt_swiftness] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:swiftness"}}]} run function gm4_potion_liquids:item_drain/potion

execute if score @s[tag=gm4_lt_swiftness] gm4_lt_value matches ..297 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:long_swiftness"}}]} run function gm4_potion_liquids:item_drain/long_potion

#strong swiftness
execute if score @s[tag=gm4_lt_strong_swiftness] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:strong_swiftness"}}]} run function gm4_potion_liquids:item_drain/potion

#slowness
execute if score @s[tag=gm4_lt_slowness] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:slowness"}}]} run function gm4_potion_liquids:item_drain/potion

execute if score @s[tag=gm4_lt_slowness] gm4_lt_value matches ..297 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:long_slowness"}}]} run function gm4_potion_liquids:item_drain/long_potion

#strong slowness
execute if score @s[tag=gm4_lt_strong_slowness] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:strong_slowness"}}]} run function gm4_potion_liquids:item_drain/potion

#turtle master
execute if score @s[tag=gm4_lt_turtle_master] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:turtle_master"}}]} run function gm4_potion_liquids:item_drain/potion

execute if score @s[tag=gm4_lt_turtle_master] gm4_lt_value matches ..297 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:long_turtle_master"}}]} run function gm4_potion_liquids:item_drain/long_potion

#strong turtle master
execute if score @s[tag=gm4_lt_strong_turtle_master] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:strong_turtle_master"}}]} run function gm4_potion_liquids:item_drain/potion

#water breathing
execute if score @s[tag=gm4_lt_water_breathing] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:water_breathing"}}]} run function gm4_potion_liquids:item_drain/potion

execute if score @s[tag=gm4_lt_water_breathing] gm4_lt_value matches ..297 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:long_water_breathing"}}]} run function gm4_potion_liquids:item_drain/long_potion

#healing
execute if score @s[tag=gm4_lt_healing] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:healing"}}]} run function gm4_potion_liquids:item_drain/potion

#strong healing
execute if score @s[tag=gm4_lt_strong_healing] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:strong_healing"}}]} run function gm4_potion_liquids:item_drain/potion

#harming
execute if score @s[tag=gm4_lt_harming] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:harming"}}]} run function gm4_potion_liquids:item_drain/potion

#strong harming
execute if score @s[tag=gm4_lt_strong_harming] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:strong_harming"}}]} run function gm4_potion_liquids:item_drain/potion

#poison
execute if score @s[tag=gm4_lt_poison] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:poison"}}]} run function gm4_potion_liquids:item_drain/potion

execute if score @s[tag=gm4_lt_poison] gm4_lt_value matches ..297 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:long_poison"}}]} run function gm4_potion_liquids:item_drain/long_potion

#strong poison
execute if score @s[tag=gm4_lt_strong_poison] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:strong_poison"}}]} run function gm4_potion_liquids:item_drain/potion

#regeneration
execute if score @s[tag=gm4_lt_regeneration] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:regeneration"}}]} run function gm4_potion_liquids:item_drain/potion

execute if score @s[tag=gm4_lt_regeneration] gm4_lt_value matches ..297 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:long_regeneration"}}]} run function gm4_potion_liquids:item_drain/long_potion

#strong regeneration
execute if score @s[tag=gm4_lt_strong_regeneration] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:strong_regeneration"}}]} run function gm4_potion_liquids:item_drain/potion

#strength
execute if score @s[tag=gm4_lt_strength] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:strength"}}]} run function gm4_potion_liquids:item_drain/potion

execute if score @s[tag=gm4_lt_strength] gm4_lt_value matches ..297 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:long_strength"}}]} run function gm4_potion_liquids:item_drain/long_potion

#strong strength
execute if score @s[tag=gm4_lt_strong_strength] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:strong_strength"}}]} run function gm4_potion_liquids:item_drain/potion

#weakness
execute if score @s[tag=gm4_lt_weakness] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:weakness"}}]} run function gm4_potion_liquids:item_drain/potion

execute if score @s[tag=gm4_lt_weakness] gm4_lt_value matches ..297 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:long_weakness"}}]} run function gm4_potion_liquids:item_drain/long_potion

#luck
execute if score @s[tag=gm4_lt_luck] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:luck"}}]} run function gm4_potion_liquids:item_drain/potion

#slow falling
execute if score @s[tag=gm4_lt_slow_falling] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:slow_falling"}}]} run function gm4_potion_liquids:item_drain/potion

execute if score @s[tag=gm4_lt_slow_falling] gm4_lt_value matches ..297 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:long_slow_falling"}}]} run function gm4_potion_liquids:item_drain/long_potion

#floating - added by module
execute if score @s[tag=gm4_lt_floating] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"potion_liquids:floating"}}]} run function gm4_potion_liquids:item_drain/potion
