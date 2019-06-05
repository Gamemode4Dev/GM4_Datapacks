#@s = tool band is trying to apply to
#run from add_band

execute store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:diamond_pickaxe"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:iron_pickaxe"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:golden_pickaxe"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:stone_pickaxe"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:wooden_pickaxe"}}]

execute if score valid_tool gm4_ml_data matches 1 run data merge entity @s {Item:{tag:{gm4_metallurgy:{has_shamir:1b,active_shamir:"forterra",ore_type:"copper"},display:{Lore:["§6Copper Band","§bShamir:","§7Forterra"]}}},Tags:["gm4_ml_smooshed"]}
