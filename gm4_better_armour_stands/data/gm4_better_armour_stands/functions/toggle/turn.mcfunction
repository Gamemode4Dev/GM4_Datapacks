# @s = armor_stand to be modified
# at @s
# run from apply_book

execute if data storage gm4_better_armour_stands:temp {pages:["left"]} run tag @s add gm4_turn_anticlockwise
execute if data storage gm4_better_armour_stands:temp {pages:["left"]} run tag @s remove gm4_turn_clockwise

execute if data storage gm4_better_armour_stands:temp {pages:["right"]} run tag @s add gm4_turn_clockwise
execute if data storage gm4_better_armour_stands:temp {pages:["right"]} run tag @s remove gm4_turn_anticlockwise

execute if data storage gm4_better_armour_stands:temp {pages:["stop"]} run tag @s remove gm4_turn_clockwise
execute if data storage gm4_better_armour_stands:temp {pages:["stop"]} run tag @s remove gm4_turn_anticlockwise
