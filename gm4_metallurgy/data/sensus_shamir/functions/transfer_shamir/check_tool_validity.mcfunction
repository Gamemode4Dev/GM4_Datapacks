#@s = tool band is trying to apply to
#run from add_band

execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:compass"}}]

execute if score valid_tool gm4_ml_data matches 1 run data merge entity @s {Item:{tag:{gm4_metallurgy:{has_shamir:1b,active_shamir:"sensus",ore_type:"barium"},display:{Lore:["§fBarium Band","§bShamir:","§7Sensus"]}}},Tags:["gm4_ml_smooshed"]}
