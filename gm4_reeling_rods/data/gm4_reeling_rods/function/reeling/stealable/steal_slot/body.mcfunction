# Steal Body
# @s = wolf, llama or horse
# at bobber in @s
# run from hooked_entity/select_type & reeling/llama & reeling/horse

# fails
execute unless data entity @s equipment.body run return fail
execute if data entity @s {drop_chances:{body:0.0f}} run return run function gm4_reeling_rods:reeling/stealable/zero_chance

# steal slot
data modify storage gm4_reeling_rods:temp item_data set value {}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s equipment.body
function gm4_reeling_rods:pull_items
item replace entity @s armor.body with minecraft:air

playsound minecraft:entity.item.pickup neutral @a[distance=..16] ~ ~ ~
return 8
