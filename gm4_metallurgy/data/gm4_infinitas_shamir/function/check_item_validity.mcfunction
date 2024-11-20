# @s = band is trying to apply to
# run from #gm4_metallurgy:check_item_validity

execute if items entity @e[type=item,tag=gm4_ml_source,dx=0] contents *[custom_data~{gm4_metallurgy:{stored_shamir:'infinitas'}}] if items entity @s contents #gm4_infinitas_shamir:valid_items run scoreboard players set valid_item gm4_ml_data 1
execute if score $lava_infinitas gm4_ml_data matches 1 if items entity @e[type=item,tag=gm4_ml_source,dx=0] contents *[custom_data~{gm4_metallurgy:{stored_shamir:'infinitas'}}] if items entity @s contents minecraft:lava_bucket run scoreboard players set valid_item gm4_ml_data 1
execute if score $powder_snow_infinitas gm4_ml_data matches 1 if items entity @e[type=item,tag=gm4_ml_source,dx=0] contents *[custom_data~{gm4_metallurgy:{stored_shamir:'infinitas'}}] if items entity @s contents minecraft:powder_snow_bucket run scoreboard players set valid_item gm4_ml_data 1

# updates Spiraculum shamirs to Infinitas
execute if items entity @e[type=item,tag=gm4_ml_source,dx=0] contents *[custom_data~{gm4_metallurgy:{stored_shamir:'spiraculum'}}] if items entity @s contents #gm4_infinitas_shamir:valid_items run scoreboard players set valid_item gm4_ml_data 1
execute if score $lava_infinitas gm4_ml_data matches 1 if items entity @e[type=item,tag=gm4_ml_source,dx=0] contents *[custom_data~{gm4_metallurgy:{stored_shamir:'spiraculum'}}] if items entity @s contents minecraft:lava_bucket run scoreboard players set valid_item gm4_ml_data 1
execute if score $powder_snow_infinitas gm4_ml_data matches 1 if items entity @e[type=item,tag=gm4_ml_source,dx=0] contents *[custom_data~{gm4_metallurgy:{stored_shamir:'spiraculum'}}] if items entity @s contents minecraft:powder_snow_bucket run scoreboard players set valid_item gm4_ml_data 1
