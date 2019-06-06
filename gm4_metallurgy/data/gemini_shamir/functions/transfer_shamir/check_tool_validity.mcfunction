#@s = tool band is trying to apply to
#run from add_band
execute store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:diamond_hoe"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:iron_hoe"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:golden_hoe"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:stone_hoe"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:wooden_hoe"}}]

execute if score valid_tool gm4_ml_data matches 1 run data merge entity @s {Item:{tag:{gm4_metallurgy:{has_shamir:1b,active_shamir:"gemini",ore_type:"barimium"},display:{Lore:['{"text":"Barimium Band","color":"light_purple","italic":false}','{"text":"Shamir","color":"aqua","italic":false}','{"text":"Gemini","color":"gray","italic":false}']}}},Tags:["gm4_ml_smooshed"]}
