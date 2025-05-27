# Action for reeled wolf
# @s = wolf
# at bobber in @s
# run from fished/select_type

# fail if no Owner
execute unless data entity @s Owner run return fail

data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s equipment.body
item replace entity @s armor.body with air
function gm4_reeling_rods:pull_items
