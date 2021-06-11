#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

# new smart interface handles the logic for whether there is enough liquid to fill the bottle and interrupts if not enough

#all potions have the same liquid-amount rules, so we'll process here 
execute unless block ~ ~-1 ~ soul_fire run scoreboard players set $item_value gm4_lt_value -1
execute if block ~ ~-1 ~ soul_fire run scoreboard players set $item_value gm4_lt_value -9

#harming
execute if entity @s[tag=gm4_lt_zauber_harming_potion] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_zauber_liquids:item_fill/zauber_harming_potion

#healing
execute if entity @s[tag=gm4_lt_zauber_healing_potion] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_zauber_liquids:item_fill/zauber_healing_potion

#leaping
execute if entity @s[tag=gm4_lt_zauber_leaping_potion] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_zauber_liquids:item_fill/zauber_leaping_potion

#poison
execute if entity @s[tag=gm4_lt_zauber_poison_potion] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_zauber_liquids:item_fill/zauber_poison_potion

#regeneration
execute if entity @s[tag=gm4_lt_zauber_regeneration_potion] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_zauber_liquids:item_fill/zauber_regeneration_potion

#speed
execute if entity @s[tag=gm4_lt_zauber_swiftness_potion] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_zauber_liquids:item_fill/zauber_swiftness_potion

#strength
execute if entity @s[tag=gm4_lt_zauber_strength_potion] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_zauber_liquids:item_fill/zauber_strength_potion

#wormhole
execute if entity @s[tag=gm4_lt_zauber_wormhole_potion] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_zauber_liquids:item_fill/zauber_wormhole_potion
