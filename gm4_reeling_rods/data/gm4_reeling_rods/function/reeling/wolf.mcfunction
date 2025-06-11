# Action for reeled wolf
# @s = wolf
# at bobber in @s
# run from hooked_entity/select_type

# fail if no Owner and if no armor
execute unless data entity @s Owner run return fail
execute unless data entity @s equipment.body run return fail

data modify storage gm4_reeling_rods:temp item_data set value {}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s equipment.body
item replace entity @s armor.body with air
function gm4_reeling_rods:pull_items

playsound minecraft:entity.item.pickup neutral @a[distance=..16] ~ ~ ~
