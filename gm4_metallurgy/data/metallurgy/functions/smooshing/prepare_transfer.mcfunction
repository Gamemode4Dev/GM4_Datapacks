#@s = item being crushed by a piston that has a shamir
#run from pulse_check

#only call expansions that deal with the metal type of the smooshed item
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"copper"}}}}] run function #metallurgy:transfer_shamir/copper
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"aluminium"}}}}] run function #metallurgy:transfer_shamir/aluminium
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"barium"}}}}] run function #metallurgy:transfer_shamir/barium
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"thorium"}}}}] run function #metallurgy:transfer_shamir/thorium
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"barimium"}}}}] run function #metallurgy:transfer_shamir/barimium
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{ore_type:"thorium_brass"}}}}] run function #metallurgy:transfer_shamir/thorium_brass
