
data merge entity @s {Item:{id:"player_head",tag:{gm4_metallurgy:{has_shamir:1b},display:{Lore:[]}}}}
data modify entity @s Item.tag.display.Lore append from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.display.Lore[-1]
data modify entity @s Item.tag.gm4_metallurgy.stored_shamir set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.active_shamir
data modify entity @s Item.tag.gm4_metallurgy.ore_type set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.ore_type
data modify entity @s Item.tag.gm4_metallurgy.custom_model_data set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.custom_model_data

execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"aluminium"}}}}] run function metallurgy:casting/finish_band/aluminium
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"barimium"}}}}] run function metallurgy:casting/finish_band/barimium
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"barium"}}}}] run function metallurgy:casting/finish_band/barium
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"copper"}}}}] run function metallurgy:casting/finish_band/copper
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"thorium_brass"}}}}] run function metallurgy:casting/finish_band/thorium_brass
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"thorium"}}}}] run function metallurgy:casting/finish_band/thorium

scoreboard players set valid_obsidian gm4_ml_data 1
