#@s = tool band is trying to apply to
#run from add_band

execute store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:iron_sword"}}]
execute unless score valid_tool gm4_ml_data matches 1 store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:iron_axe"}}]

execute if score valid_tool gm4_ml_data matches 1 run data merge entity @s {Item:{tag:{gm4_metallurgy:{has_shamir:1b,active_shamir:"conduction",ore_type:"thorium"},display:{Lore:['{"text":"Thorium Band","color":"dark_gray","italic":false}','{"text":"Shamir","color":"aqua","italic":false}','{"text":"Conduction","color":"gray","italic":false}']}}},Tags:["gm4_ml_smooshed"]}
