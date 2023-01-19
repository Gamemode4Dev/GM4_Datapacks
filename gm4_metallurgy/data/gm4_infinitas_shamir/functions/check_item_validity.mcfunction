# @s = band is trying to apply to
# run from #gm4_metallurgy:check_item_validity

execute if entity @e[type=item,tag=gm4_ml_source,dx=0,nbt={Item:{tag:{gm4_metallurgy:{stored_shamir:"infinitas"}}}}] run function gm4_infinitas_shamir:mark_item_validity

# updates Spiraculum shamirs to Infinitas
execute if entity @e[type=item,tag=gm4_ml_source,dx=0,nbt={Item:{tag:{gm4_metallurgy:{stored_shamir:"spiraculum"}}}}] run function gm4_infinitas_shamir:mark_item_validity
