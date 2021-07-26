#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

#water bucket
execute if entity @s[tag=gm4_lt_water] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:bucket"}} run function gm4_standard_liquids:item_fill/water_bucket

#water bottle
execute if entity @s[tag=gm4_lt_water] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_standard_liquids:item_fill/water_bottle

#lava bucket
execute if entity @s[tag=gm4_lt_lava] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:bucket"}} run function gm4_standard_liquids:item_fill/lava_bucket

#milk bucket
execute if entity @s[tag=gm4_lt_milk] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:bucket"}} run function gm4_standard_liquids:item_fill/milk_bucket

#mushroom stew
execute if entity @s[tag=gm4_lt_mushroom_stew] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:bowl"}} run function gm4_standard_liquids:item_fill/mushroom_stew

#rabbit stew
execute if entity @s[tag=gm4_lt_rabbit_stew] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:bowl"}} run function gm4_standard_liquids:item_fill/rabbit_stew

#beetroot soup
execute if entity @s[tag=gm4_lt_beetroot_soup] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:bowl"}} run function gm4_standard_liquids:item_fill/beetroot_soup

#experience bottle
execute if entity @s[tag=gm4_lt_experience] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_standard_liquids:item_fill/experience_bottle

#honey bottle
execute if entity @s[tag=gm4_lt_honey] if score $stack_size gm4_lt_value matches ..16 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glass_bottle"}} run function gm4_standard_liquids:item_fill/honey_bottle

#powder snow bucket
execute if entity @s[tag=gm4_lt_powder_snow] if score $stack_size gm4_lt_value matches 1 if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:bucket"}} run function gm4_standard_liquids:item_fill/powder_snow_bucket
