# @s = liquid tank with item in first slot
# run from #potion_liquids:expansion_item_drain

# lightning from lightning in a bottle
execute if entity @s[tag=gm4_lt_liab_lightning] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_lightning_in_a_bottle:1b}}} run function gm4_potion_liquids:item_drain/potion

# blindness
execute if entity @s[tag=gm4_lt_blindness] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{Potion:"gm4:blindness"}}} run function gm4_potion_liquids:item_drain/potion
