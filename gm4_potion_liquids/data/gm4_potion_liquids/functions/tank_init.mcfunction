#@s = empty liquid tank with item in first slot or entity on top
#run from liquid_tanks:item_process

#night vision
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:night_vision"}}} run function gm4_potion_liquids:liquid_init/night_vision
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_night_vision"}}} run function gm4_potion_liquids:liquid_init/night_vision

#invisibility
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:invisibility"}}} run function gm4_potion_liquids:liquid_init/invisibility
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_invisibility"}}} run function gm4_potion_liquids:liquid_init/invisibility

#leaping
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:leaping"}}} run function gm4_potion_liquids:liquid_init/leaping
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_leaping"}}} run function gm4_potion_liquids:liquid_init/leaping

#strong leaping
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_leaping"}}} run function gm4_potion_liquids:liquid_init/strong_leaping

#fire resistance
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:fire_resistance"}}} run function gm4_potion_liquids:liquid_init/fire_resistance
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_fire_resistance"}}} run function gm4_potion_liquids:liquid_init/fire_resistance

#swiftness
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:swiftness"}}} run function gm4_potion_liquids:liquid_init/swiftness
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_swiftness"}}} run function gm4_potion_liquids:liquid_init/swiftness

#strong swiftness
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_swiftness"}}} run function gm4_potion_liquids:liquid_init/strong_swiftness

#slowness
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:slowness"}}} run function gm4_potion_liquids:liquid_init/slowness
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_slowness"}}} run function gm4_potion_liquids:liquid_init/slowness

#strong slowness
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_slowness"}}} run function gm4_potion_liquids:liquid_init/strong_slowness

#turtle master
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:turtle_master"}}} run function gm4_potion_liquids:liquid_init/turtle_master
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_turtle_master"}}} run function gm4_potion_liquids:liquid_init/turtle_master

#strong turtle master
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_turtle_master"}}} run function gm4_potion_liquids:liquid_init/strong_turtle_master

#water breathing
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:water_breathing"}}} run function gm4_potion_liquids:liquid_init/water_breathing
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_water_breathing"}}} run function gm4_potion_liquids:liquid_init/water_breathing

#healing
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:healing"}}} run function gm4_potion_liquids:liquid_init/healing

#strong healing
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_healing"}}} run function gm4_potion_liquids:liquid_init/strong_healing

#harming
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:harming"}}} run function gm4_potion_liquids:liquid_init/harming

#strong harming
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_harming"}}} run function gm4_potion_liquids:liquid_init/strong_harming

#poison
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:poison"}}} run function gm4_potion_liquids:liquid_init/poison
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_poison"}}} run function gm4_potion_liquids:liquid_init/poison

#strong poison
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_poison"}}} run function gm4_potion_liquids:liquid_init/strong_poison

#regeneration
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:regeneration"}}} run function gm4_potion_liquids:liquid_init/regeneration
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_regeneration"}}} run function gm4_potion_liquids:liquid_init/regeneration

#strong regeneration
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_regeneration"}}} run function gm4_potion_liquids:liquid_init/strong_regeneration

#strength
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strength"}}} run function gm4_potion_liquids:liquid_init/strength
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_strength"}}} run function gm4_potion_liquids:liquid_init/strength

#strong strength
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:strong_strength"}}} run function gm4_potion_liquids:liquid_init/strong_strength

#weakness
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:weakness"}}} run function gm4_potion_liquids:liquid_init/weakness
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_weakness"}}} run function gm4_potion_liquids:liquid_init/weakness

#luck
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:luck"}}} run function gm4_potion_liquids:liquid_init/luck

#slow falling
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:slow_falling"}}} run function gm4_potion_liquids:liquid_init/slow_falling
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:long_slow_falling"}}} run function gm4_potion_liquids:liquid_init/slow_falling

#floating - added by module
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"potion_liquids:floating"}}} run function gm4_potion_liquids:liquid_init/floating
