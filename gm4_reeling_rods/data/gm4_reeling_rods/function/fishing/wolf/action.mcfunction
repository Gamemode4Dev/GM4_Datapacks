# Action for reeled wolf
# @s = wolf
# at @s
# run from fishing/wolf/adv and fishing/wolf/adv_baby

# fail if no Owner
execute unless data entity @s Owner run return fail

data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s body_armor_item
data remove entity @s body_armor_item
execute positioned ~ ~0.4 ~ run function gm4_reeling_rods:separate
