
data modify entity @s Item.tag.gm4_metallurgy.ore_type set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.ore_type

execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"aluminium"}}}}] run loot spawn ~ ~ ~ loot gm4_metallurgy:aluminium_band
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"barimium"}}}}] run loot spawn ~ ~ ~ loot gm4_metallurgy:barimium_band
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"barium"}}}}] run loot spawn ~ ~ ~ loot gm4_metallurgy:barium_band
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"copper"}}}}] run loot spawn ~ ~ ~ loot gm4_metallurgy:copper_band
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"thorium_brass"}}}}] run loot spawn ~ ~ ~ loot gm4_metallurgy:thorium_brass_band
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"thorium"}}}}] run loot spawn ~ ~ ~ loot gm4_metallurgy:thorium_band

execute as @e[type=item,distance=0,limit=1] run function gm4_metallurgy:smooshing/remove_band/finish_item

scoreboard players set valid_obsidian gm4_ml_data 1

kill @s[type=item]
