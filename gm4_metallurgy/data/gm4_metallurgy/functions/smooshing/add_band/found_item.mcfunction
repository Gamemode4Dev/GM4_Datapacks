# @s = item to receive the shamir
# @e[tag=gm4_ml_source] = shamir item
# called from smooshing/add_band/check_item

# apply the shamir to the item, copying its tags in the process
tag @s add gm4_ml_smooshed
data modify entity @s Item.components."minecraft:custom_data" merge value {gm4_metallurgy:{has_shamir:1b}}
data modify entity @s Item.components."minecraft:custom_data".gm4_metallurgy.active_shamir set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.components."minecraft:custom_data".gm4_metallurgy.stored_shamir
data modify entity @s Item.components."minecraft:custom_data".gm4_metallurgy.metal.type set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.components."minecraft:custom_data".gm4_metallurgy.metal.type
data modify entity @s Item.components."minecraft:lore" prepend from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.components."minecraft:lore"[]
execute as @e[type=item,tag=gm4_ml_source,dx=0,limit=1] if data entity @s Item.components."minecraft:custom_data".gm4_metallurgy.custom_model_data run data modify entity @s Item.components."minecraft:custom_model_data" set from entity @s Item.components."minecraft:custom_data".gm4_metallurgy.custom_model_data
data modify entity @s Item.components."minecraft:custom_data".gm4_metallurgy.custom_model_data set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.components."minecraft:custom_model_data"
execute unless data entity @s Item.components."minecraft:custom_model_data" run data modify entity @s Item.components."minecraft:custom_model_data" set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.components."minecraft:custom_model_data"

function #gm4_metallurgy:apply_band

# use anvil durability
function gm4_metallurgy:smooshing/anvil/use
