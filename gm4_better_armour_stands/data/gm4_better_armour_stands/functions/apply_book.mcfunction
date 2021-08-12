# @s = armor_stand to be modified
# at @s
# run from store_book_pages

# Restore armor stand state to default.
execute if data storage gm4_better_armour_stands:temp {pages:["default"]} run function gm4_better_armour_stands:default

# Toggle armor stand arms.
execute if data storage gm4_better_armour_stands:temp {pages:["no arms"]} run function gm4_better_armour_stands:toggle/no_arms

# Toggle armor stand gravity.
execute if data storage gm4_better_armour_stands:temp {pages:["gravity"]} run function gm4_better_armour_stands:toggle/gravity

# Toggle armor stand height.
execute if data storage gm4_better_armour_stands:temp {pages:["size"]} run function gm4_better_armour_stands:toggle/size

# Toggle armor stand base.
execute if data storage gm4_better_armour_stands:temp {pages:["base"]} run function gm4_better_armour_stands:toggle/base

# Toggle armor stand visibility.
execute if data storage gm4_better_armour_stands:temp {pages:["visible"]} run function gm4_better_armour_stands:toggle/visible

# Rotate the armor stand by predefined intervals.
execute if data storage gm4_better_armour_stands:temp {pages:["turn left"]} run tag @s add gm4_turn_anticlockwise
execute if data storage gm4_better_armour_stands:temp {pages:["turn left"]} run tag @s remove gm4_turn_clockwise
execute if data storage gm4_better_armour_stands:temp {pages:["turn right"]} run tag @s add gm4_turn_clockwise
execute if data storage gm4_better_armour_stands:temp {pages:["turn right"]} run tag @s remove gm4_turn_anticlockwise
execute if data storage gm4_better_armour_stands:temp {pages:["no turn"]} run tag @s remove gm4_turn_clockwise
execute if data storage gm4_better_armour_stands:temp {pages:["no turn"]} run tag @s remove gm4_turn_anticlockwise

# Equip item into specified slot even if this is normally impossible.
execute if data storage gm4_better_armour_stands:temp {pages:["equip head"]} run function gm4_better_armour_stands:equip/head
execute if data storage gm4_better_armour_stands:temp {pages:["equip hand"]} run function gm4_better_armour_stands:equip/hand
execute if data storage gm4_better_armour_stands:temp {pages:["equip offhand"]} run function gm4_better_armour_stands:equip/offhand
