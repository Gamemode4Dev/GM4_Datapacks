#@s = empty liquid tank with item in first slot or entity on top
#run from liquid_tanks:item_process

#water
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:water_bucket"}} run function gm4_standard_liquids:liquid_init/water
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"minecraft:water"}}} run function gm4_standard_liquids:liquid_init/water

#lava
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:lava_bucket"}} run function gm4_standard_liquids:liquid_init/lava

#milk
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:milk_bucket"}} run function gm4_standard_liquids:liquid_init/milk

#mushroom stew
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:mushroom_stew"}} run function gm4_standard_liquids:liquid_init/mushroom_stew

#rabbit stew
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:rabbit_stew"}} run function gm4_standard_liquids:liquid_init/rabbit_stew

#beetroot soup
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:beetroot_soup"}} run function gm4_standard_liquids:liquid_init/beetroot_soup
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:beetroot"}} run function gm4_standard_liquids:liquid_init/beetroot_soup

#experience
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:experience_bottle"}} run function gm4_standard_liquids:liquid_init/experience
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:enchanted_book"}} run function gm4_standard_liquids:liquid_init/experience

#honey
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:honey_bottle"}} run function gm4_standard_liquids:liquid_init/honey
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:honey_block"}} run function gm4_standard_liquids:liquid_init/honey

#powder snow
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:powder_snow_bucket"}} run function gm4_standard_liquids:liquid_init/powder_snow

#ink
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:ink_sac"}} run function gm4_standard_liquids:liquid_init/ink
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_standard_liquids:{potion:"blindness"}}}} run function gm4_standard_liquids:liquid_init/ink


#glow ink
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:glow_ink_sac"}} run function gm4_standard_liquids:liquid_init/glow_ink
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_standard_liquids:{potion:"glowing"}}}} run function gm4_standard_liquids:liquid_init/glow_ink
