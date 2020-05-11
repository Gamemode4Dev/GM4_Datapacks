#@s = band is trying to apply to
#run from #gm4_metallurgy:check_item_validity

execute store success score new_helious_band gm4_ml_data if entity @e[type=item,tag=gm4_ml_source,dx=0,nbt={Item:{tag:{gm4_metallurgy:{stored_shamir:"helious"}}}}] run function gm4_helious_shamir:mark_item_validity

# repair shamirs that were made during 1.13-1.15 (fixes typo)
execute unless score new_helious_band gm4_ml_data matches 1 if entity @e[type=item,tag=gm4_ml_source,dx=0,nbt={Item:{tag:{gm4_metallurgy:{stored_shamir:"helios"}}}}] run function gm4_helious_shamir:mark_item_validity

# reset fake player
scoreboard players reset new_helious_band gm4_ml_data
