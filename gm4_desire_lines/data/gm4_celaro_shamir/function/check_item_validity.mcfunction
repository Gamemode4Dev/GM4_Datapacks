#@s = band is trying to apply to
#run from #gm4_metallurgy:check_item_validity

execute if items entity @e[type=item,tag=gm4_ml_source,dx=0] contents *[custom_data~{gm4_metallurgy:{stored_shamir:'celaro'}}] if items entity @s contents #gm4_celaro_shamir:valid_items run scoreboard players set valid_item gm4_ml_data 1
