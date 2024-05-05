# remove armor from wolf
# @s = wolf that is waering armor
# at @s
# run from armor/type/canine/wolf_interact_check

# spawn item with the data
data modify storage gm4_combat_expanded:temp body_armor_item.data set from entity @s body_armor_item
function gm4_combat_expanded:armor/modifier/type/canine/eval_dropped_armor with storage gm4_combat_expanded:temp body_armor_item
data remove storage gm4_combat_expanded:temp body_armor_item

# remove armor from wolf
data remove entity @s body_armor_item
