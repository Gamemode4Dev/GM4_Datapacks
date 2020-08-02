data merge entity @s {Tags:["gm4_ml_smooshed"],Item:{tag:{gm4_metallurgy:{has_shamir:1b}}}}
data modify entity @s Item.tag.gm4_metallurgy.active_shamir set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.stored_shamir
data modify entity @s Item.tag.gm4_metallurgy.ore_type set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.ore_type
data modify entity @s Item.tag.display.Lore set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.display.Lore
execute unless data entity @s Item.tag.CustomModelData run data modify entity @s Item.tag.CustomModelData set from entity @s Item.tag.CustomModelData
function #gm4_metallurgy:apply_band
