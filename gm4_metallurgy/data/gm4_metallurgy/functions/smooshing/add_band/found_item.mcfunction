data merge entity @s {Tags:["gm4_ml_smooshed"],Item:{tag:{gm4_metallurgy:{has_shamir:1b}}}}
data modify entity @s Item.tag.gm4_metallurgy.active_shamir set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.stored_shamir
data modify entity @s Item.tag.gm4_metallurgy.metal.type set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.metal.type
data modify entity @s Item.tag.display.Lore set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.display.Lore
execute as @e[type=item,tag=gm4_ml_source,dx=0,limit=1] if data entity @s Item.tag.gm4_metallurgy.custom_model_data run data modify entity @s Item.tag.CustomModelData set from entity @s Item.tag.gm4_metallurgy.custom_model_data
data modify entity @s Item.tag.gm4_metallurgy.custom_model_data set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.CustomModelData
execute unless data entity @s Item.tag.CustomModelData run data modify entity @s Item.tag.CustomModelData set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.CustomModelData
function #gm4_metallurgy:apply_band

# use anvil durability
function gm4_metallurgy:smooshing/anvil/use
