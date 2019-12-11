#@s = band is trying to apply to
#run from #metallurgy:check_item_validity

execute if entity @e[type=item,tag=gm4_ml_source,dx=0,nbt={Item:{tag:{gm4_metallurgy:{stored_shamir:"forterra"}}}}] run function forterra_shamir:mark_item_validity
