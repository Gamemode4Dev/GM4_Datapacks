#called by the advancement boots_of_ostara:enable_boots when they enable a pair of boots
execute as @s[nbt=!{Inventory:[{Slot:100b,id:"minecraft:leather_boots",tag:{gm4_boots_of_ostara:1b}}]}] run advancement revoke @s only gm4_boots_of_ostara:enable_boots
