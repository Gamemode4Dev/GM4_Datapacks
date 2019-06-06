#@s = tool band is trying to apply to
#run from add_band

execute store success score valid_tool gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:compass"}}]

execute if score valid_tool gm4_ml_data matches 1 run data merge entity @s {Item:{tag:{gm4_metallurgy:{has_shamir:1b,active_shamir:"sensus",ore_type:"barium"},display:{Lore:['{"text":"Barium Band","color":"white","italic":false}','{"text":"Shamir","color":"aqua","italic":false}','{"text":"Sensus","color":"gray","italic":false}']}}},Tags:["gm4_ml_smooshed"]}
