#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

#night_vision
execute if entity @s[tag=gm4_lt_night_vision] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:night_vision"}}} run function gm4_potion_liquids:item_drain/potion
execute if entity @s[tag=gm4_lt_night_vision] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_night_vision"}}} run function gm4_potion_liquids:item_drain/long_potion

#invisibility
execute if entity @s[tag=gm4_lt_invisibility] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:invisibility"}}} run function gm4_potion_liquids:item_drain/potion
execute if entity @s[tag=gm4_lt_invisibility] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_invisibility"}}} run function gm4_potion_liquids:item_drain/long_potion

#leaping
execute if entity @s[tag=gm4_lt_leaping] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:leaping"}}} run function gm4_potion_liquids:item_drain/potion
execute if entity @s[tag=gm4_lt_leaping] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_leaping"}}} run function gm4_potion_liquids:item_drain/long_potion

#strong leaping
execute if entity @s[tag=gm4_lt_strong_leaping] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_leaping"}}} run function gm4_potion_liquids:item_drain/potion

#fire resistance
execute if entity @s[tag=gm4_lt_fire_resistance] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:fire_resistance"}}} run function gm4_potion_liquids:item_drain/potion
execute if entity @s[tag=gm4_lt_fire_resistance] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_fire_resistance"}}} run function gm4_potion_liquids:item_drain/long_potion

#swiftness
execute if entity @s[tag=gm4_lt_swiftness] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:swiftness"}}} run function gm4_potion_liquids:item_drain/potion
execute if entity @s[tag=gm4_lt_swiftness] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_swiftness"}}} run function gm4_potion_liquids:item_drain/long_potion

#strong swiftness
execute if entity @s[tag=gm4_lt_strong_swiftness] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_swiftness"}}} run function gm4_potion_liquids:item_drain/potion

#slowness
execute if entity @s[tag=gm4_lt_slowness] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:slowness"}}} run function gm4_potion_liquids:item_drain/potion
execute if entity @s[tag=gm4_lt_slowness] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_slowness"}}} run function gm4_potion_liquids:item_drain/long_potion

#strong slowness
execute if entity @s[tag=gm4_lt_strong_slowness] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_slowness"}}} run function gm4_potion_liquids:item_drain/potion

#turtle master
execute if entity @s[tag=gm4_lt_turtle_master] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:turtle_master"}}} run function gm4_potion_liquids:item_drain/potion
execute if entity @s[tag=gm4_lt_turtle_master] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_turtle_master"}}} run function gm4_potion_liquids:item_drain/long_potion

#strong turtle master
execute if entity @s[tag=gm4_lt_strong_turtle_master] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_turtle_master"}}} run function gm4_potion_liquids:item_drain/potion

#water breathing
execute if entity @s[tag=gm4_lt_water_breathing] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:water_breathing"}}} run function gm4_potion_liquids:item_drain/potion
execute if entity @s[tag=gm4_lt_water_breathing] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_water_breathing"}}} run function gm4_potion_liquids:item_drain/long_potion

#healing
execute if entity @s[tag=gm4_lt_healing] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:healing"}}} run function gm4_potion_liquids:item_drain/potion

#strong healing
execute if entity @s[tag=gm4_lt_strong_healing] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_healing"}}} run function gm4_potion_liquids:item_drain/potion

#harming
execute if entity @s[tag=gm4_lt_harming] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:harming"}}} run function gm4_potion_liquids:item_drain/potion

#strong harming
execute if entity @s[tag=gm4_lt_strong_harming] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_harming"}}} run function gm4_potion_liquids:item_drain/potion

#poison
execute if entity @s[tag=gm4_lt_poison] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:poison"}}} run function gm4_potion_liquids:item_drain/potion
execute if entity @s[tag=gm4_lt_poison] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_poison"}}} run function gm4_potion_liquids:item_drain/long_potion

#strong poison
execute if entity @s[tag=gm4_lt_strong_poison] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_poison"}}} run function gm4_potion_liquids:item_drain/potion

#regeneration
execute if entity @s[tag=gm4_lt_regeneration] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:regeneration"}}} run function gm4_potion_liquids:item_drain/potion
execute if entity @s[tag=gm4_lt_regeneration] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_regeneration"}}} run function gm4_potion_liquids:item_drain/long_potion

#strong regeneration
execute if entity @s[tag=gm4_lt_strong_regeneration] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_regeneration"}}} run function gm4_potion_liquids:item_drain/potion

#strength
execute if entity @s[tag=gm4_lt_strength] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strength"}}} run function gm4_potion_liquids:item_drain/potion
execute if entity @s[tag=gm4_lt_strength] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_strength"}}} run function gm4_potion_liquids:item_drain/long_potion

#strong strength
execute if entity @s[tag=gm4_lt_strong_strength] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_strength"}}} run function gm4_potion_liquids:item_drain/potion

#weakness
execute if entity @s[tag=gm4_lt_weakness] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:weakness"}}} run function gm4_potion_liquids:item_drain/potion
execute if entity @s[tag=gm4_lt_weakness] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_weakness"}}} run function gm4_potion_liquids:item_drain/long_potion

#luck
execute if entity @s[tag=gm4_lt_luck] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:luck"}}} run function gm4_potion_liquids:item_drain/potion

#slow falling
execute if entity @s[tag=gm4_lt_slow_falling] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:slow_falling"}}} run function gm4_potion_liquids:item_drain/potion
execute if entity @s[tag=gm4_lt_slow_falling] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_slow_falling"}}} run function gm4_potion_liquids:item_drain/long_potion

#floating - added by module
execute if entity @s[tag=gm4_lt_floating] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"potion_liquids:floating"}}} run function gm4_potion_liquids:item_drain/potion
