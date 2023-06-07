#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

#water
execute if entity @s[tag=gm4_lt_water] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:water_bucket"}} run function gm4_standard_liquids:item_drain/bucket
execute if entity @s[tag=gm4_lt_water] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:water"}}} run function gm4_standard_liquids:item_drain/bottle

#lava
execute if entity @s[tag=gm4_lt_lava] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:lava_bucket"}} run function gm4_standard_liquids:item_drain/bucket

#milk
execute if entity @s[tag=gm4_lt_milk] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:milk_bucket"}} run function gm4_standard_liquids:item_drain/bucket

#mushroom stew
execute if entity @s[tag=gm4_lt_mushroom_stew] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:mushroom_stew"}} run function gm4_standard_liquids:item_drain/bowl

#rabbit stew
execute if entity @s[tag=gm4_lt_rabbit_stew] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:rabbit_stew"}} run function gm4_standard_liquids:item_drain/bowl

#beetroot soup
execute if entity @s[tag=gm4_lt_beetroot_soup] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:beetroot_soup"}} run function gm4_standard_liquids:item_drain/bowl
execute if entity @s[tag=gm4_lt_beetroot_soup] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:beetroot"}} run function gm4_standard_liquids:item_drain/beetroot

#experience
execute if entity @s[tag=gm4_lt_experience] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:experience_bottle"}} run function gm4_standard_liquids:item_drain/experience_bottle
execute if entity @s[tag=gm4_lt_experience] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:enchanted_book"}} run function gm4_standard_liquids:item_drain/enchanted_book
execute if entity @s[tag=gm4_lt_experience] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:paper",tag:{gm4_book_binders:{item:"enchanted_page"}}}} run function gm4_standard_liquids:item_drain/enchanted_page

#honey
execute if entity @s[tag=gm4_lt_honey] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:honey_bottle"}} run function gm4_standard_liquids:item_drain/bottle
execute if entity @s[tag=gm4_lt_honey] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:honey_block"}} run function gm4_standard_liquids:item_drain/honey_block

#powder snow
execute if entity @s[tag=gm4_lt_powder_snow] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:powder_snow_bucket"}} run function gm4_standard_liquids:item_drain/bucket

#ink
execute if entity @s[tag=gm4_lt_ink] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:ink_sac"}} run function gm4_standard_liquids:item_drain/ink_sac
execute if entity @s[tag=gm4_lt_ink] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_standard_liquids:{potion:"blindness"}}}} run function gm4_standard_liquids:item_drain/bottle

#glow ink
execute if entity @s[tag=gm4_lt_glow_ink] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glow_ink_sac"}} run function gm4_standard_liquids:item_drain/ink_sac
execute if entity @s[tag=gm4_lt_glow_ink] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_standard_liquids:{potion:"glowing"}}}} run function gm4_standard_liquids:item_drain/bottle
