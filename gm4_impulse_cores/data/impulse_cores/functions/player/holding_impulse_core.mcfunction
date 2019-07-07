#impulse core effects base function
#@s - all players holding an impulse core
#called by impulse_cores:main

#visuals
execute unless entity @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_impulse_cores:{charge:0}}}]}] run particle minecraft:end_rod ~ ~1 ~ .1 .25 .1 .05 3 normal @a

#charge use
tag @a add gm4_impulse_cores_has_armour
execute unless entity @s[nbt={Inventory:[{Slot:103b,id:"minecraft:iron_helmet",tag:{Enchantments:[{}]}}]}] unless entity @s[nbt={Inventory:[{Slot:102b,id:"minecraft:iron_chestplate",tag:{Enchantments:[{}]}}]}] unless entity @s[nbt={Inventory:[{Slot:101b,id:"minecraft:iron_leggings",tag:{Enchantments:[{}]}}]}] unless entity @s[nbt={Inventory:[{Slot:100b,id:"minecraft:iron_boots",tag:{Enchantments:[{}]}}]}] run tag @s remove gm4_impulse_cores_has_armour
execute if entity @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_impulse_cores:{charge:0}}}]}] run tag @s remove gm4_impulse_cores_has_armour
execute if entity @s[tag=gm4_impulse_cores_has_armour] run function impulse_cores:player/has_armour

#if charge changes, update item
execute store result score @s gm4_ic_chrg_ma run data get entity @s Inventory[{Slot:-106b}].tag.gm4_impulse_cores.charge
scoreboard players operation @s gm4_ic_chrg_ma += @s gm4_ic_chrg_mo
scoreboard players set @s[scores={gm4_ic_chrg_ma=6..}] gm4_ic_chrg_ma 5
execute unless score @s gm4_ic_chrg_mo = @s gm4_ic_chrg_mo_p run function impulse_cores:item/update_charge
scoreboard players operation @s gm4_ic_chrg_mo_p = @s gm4_ic_chrg_mo
