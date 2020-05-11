#@s = band is trying to apply to
#run from #gm4_metallurgy:check_item_validity

execute if entity @e[type=item,tag=gm4_ml_source,dx=0,nbt={Item:{tag:{gm4_metallurgy:{stored_shamir:"helious"}}}}] run function gm4_helious_shamir:mark_item_validity

# repair shamirs that were made during 1.13-1.15 (fixes typo)
execute if entity @e[type=item,tag=gm4_ml_source,dx=0,nbt={Item:{tag:{gm4_metallurgy:{stored_shamir:"helios"}}}}] run function gm4_helious_shamir:mark_item_validity
