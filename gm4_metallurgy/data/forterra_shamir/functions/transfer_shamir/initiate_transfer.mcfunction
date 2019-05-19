#@s = a smooshed copper shamir item waiting to be processed.
#called from metallurgy:smooshing/prepare_transfer in base module

execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"forterra",ore_type:"copper"}}}}] run function forterra_shamir:transfer_shamir/add_band
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{has_shamir:1b,active_shamir:"forterra",ore_type:"copper"}}}}] run function forterra_shamir:transfer_shamir/remove_band
