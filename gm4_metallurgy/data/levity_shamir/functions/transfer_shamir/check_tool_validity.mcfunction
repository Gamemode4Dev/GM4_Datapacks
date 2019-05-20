#@s = tool band is trying to apply to
#run from add_band

execute store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:diamond_boots"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:golden_boots"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:chainmail_boots"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:iron_boots"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:leather_boots"}}]



execute if score valid_tool gm4_ml_data matches 1 run data merge entity @s {Item:{tag:{gm4_metallurgy:{has_shamir:1b,active_shamir:"levity",ore_type:"aluminium"},display:{Lore:["§cAluminium Band","§bShamir:","§7Levity"]}}},Tags:["gm4_ml_smooshed"]}
