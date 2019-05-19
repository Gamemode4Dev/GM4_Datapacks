#@s = all players
#run from weighted_armour:main via #weighted_armor:weight_modifiers

scoreboard players remove @s[nbt={Inventory:[{Slot:103b,tag:{gm4_metallurgy:{active_shamir:"helios"}}}]}] gm4_armor_weight 1
scoreboard players remove @s[nbt={Inventory:[{Slot:102b,tag:{gm4_metallurgy:{active_shamir:"helios"}}}]}] gm4_armor_weight 1
scoreboard players remove @s[nbt={Inventory:[{Slot:101b,tag:{gm4_metallurgy:{active_shamir:"helios"}}}]}] gm4_armor_weight 1
scoreboard players remove @s[nbt={Inventory:[{Slot:100b,tag:{gm4_metallurgy:{active_shamir:"helios"}}}]}] gm4_armor_weight 1

execute if score @s gm4_armor_weight matches ..-1 run effect give @s levitation 1 0
execute if score @s gm4_armor_weight matches ..-1 run effect give @s wither 1 1
