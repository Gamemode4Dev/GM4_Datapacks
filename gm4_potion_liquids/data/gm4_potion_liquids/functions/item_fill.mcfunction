#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

#night_vision
execute if entity @s[tag=gm4_lt_night_vision] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/night_vision_potion

#invisibility
execute if entity @s[tag=gm4_lt_invisibility] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/invisibility_potion

#leaping
execute if entity @s[tag=gm4_lt_leaping] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/leaping_potion

#strong leaping
execute if entity @s[tag=gm4_lt_strong_leaping] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/strong_leaping_potion

#fire resistance
execute if entity @s[tag=gm4_lt_fire_resistance] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/fire_resistance_potion

#swiftness
execute if entity @s[tag=gm4_lt_swiftness] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/swiftness_potion

#strong swiftness
execute if entity @s[tag=gm4_lt_strong_swiftness] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/strong_swiftness_potion

#slowness
execute if entity @s[tag=gm4_lt_slowness] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/slowness_potion

#strong slowness
execute if entity @s[tag=gm4_lt_strong_slowness] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/strong_slowness_potion

#turtle master
execute if entity @s[tag=gm4_lt_turtle_master] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/turtle_master_potion

#strong turtle master
execute if entity @s[tag=gm4_lt_strong_turtle_master] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/strong_turtle_master_potion

#water breathing
execute if entity @s[tag=gm4_lt_water_breathing] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/water_breathing_potion

#healing
execute if entity @s[tag=gm4_lt_healing] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/healing_potion

#strong healing
execute if entity @s[tag=gm4_lt_strong_healing] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/strong_healing_potion

#harming
execute if entity @s[tag=gm4_lt_harming] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/harming_potion

#strong harming
execute if entity @s[tag=gm4_lt_strong_harming] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/strong_harming_potion

#poison
execute if entity @s[tag=gm4_lt_poison] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/poison_potion

#strong poison
execute if entity @s[tag=gm4_lt_strong_poison] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/strong_poison_potion

#regeneration
execute if entity @s[tag=gm4_lt_regeneration] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/regeneration_potion

#strong regeneration
execute if entity @s[tag=gm4_lt_strong_regeneration] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/strong_regeneration_potion

#strength
execute if entity @s[tag=gm4_lt_strength] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/strength_potion

#strong strength
execute if entity @s[tag=gm4_lt_strong_strength] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/strong_strength_potion

#weakness
execute if entity @s[tag=gm4_lt_weakness] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/weakness_potion

#luck
execute if entity @s[tag=gm4_lt_luck] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/luck_potion

#slow falling
execute if entity @s[tag=gm4_lt_slow_falling] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/slow_falling_potion

#floating
execute if entity @s[tag=gm4_lt_floating] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_potion_liquids:item_fill/floating_potion
