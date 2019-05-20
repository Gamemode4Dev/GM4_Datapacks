#@s = tool band is trying to apply to
#run from add_band

execute store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:diamond_helmet"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:iron_helmet"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:golden_helmet"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:leather_helmet"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:chainmail_helmet"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:diamond_chestplate"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:iron_chestplate"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:golden_chestplate"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:leather_chestplate"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:chainmail_chestplate"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:diamond_leggings"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:iron_leggings"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:golden_leggings"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:leather_leggings"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:chainmail_leggings"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:diamond_boots"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:iron_boots"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:golden_boots"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:leather_boots"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:chainmail_boots"}}]

execute if score valid_tool gm4_ml_data matches 1 run data merge entity @s {Item:{tag:{gm4_metallurgy:{has_shamir:1b,active_shamir:"helios",ore_type:"aluminium"},display:{Lore:["§cAluminium Band","§bShamir:","§7Helios"]}}},Tags:["gm4_ml_smooshed"]}
