
# lightning from lightning in a bottle
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_lightning_in_a_bottle:1b}}} run function gm4_lightning_in_a_bottle:potion_liquids/liquid_init/lightning

# blindness
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"gm4:blindness"}}} run function gm4_lightning_in_a_bottle:potion_liquids/liquid_init/blindness
