# @s = armor stand within 1 block of a dropped writable book
execute if data storage gm4_better_armour_stands:data {pages:["default"]} run function gm4_better_armour_stands:default
execute if data storage gm4_better_armour_stands:data {pages:["no gravity"]} run data merge entity @s {NoGravity:1}
execute if data storage gm4_better_armour_stands:data {pages:["gravity"]} run data merge entity @s {NoGravity:0}
execute if data storage gm4_better_armour_stands:data {pages:["arms"]} run data merge entity @s {ShowArms:1}
execute if data storage gm4_better_armour_stands:data {pages:["arms"]} run advancement grant @a[distance=..3,gamemode=!spectator] only gm4:better_armour_stands
execute if data storage gm4_better_armour_stands:data {pages:["no arms"]} run data merge entity @s {ShowArms:0}
execute if data storage gm4_better_armour_stands:data {pages:["small"]} run data merge entity @s {Small:1}
execute if data storage gm4_better_armour_stands:data {pages:["tall"]} run data merge entity @s {Small:0}
execute if data storage gm4_better_armour_stands:data {pages:["no base"]} run data merge entity @s {NoBasePlate:1}
execute if data storage gm4_better_armour_stands:data {pages:["base"]} run data merge entity @s {NoBasePlate:0}
execute if data storage gm4_better_armour_stands:data {pages:["invisible"]} run data merge entity @s {Invisible:1b}
execute if data storage gm4_better_armour_stands:data {pages:["visible"]} run data merge entity @s {Invisible:0}

execute if data storage gm4_better_armour_stands:data {pages:["turn left"]} run tag @s add gm4_turn_clockwise
execute if data storage gm4_better_armour_stands:data {pages:["turn left"]} run tag @s remove gm4_turn_anticlockwise
execute if data storage gm4_better_armour_stands:data {pages:["turn right"]} run tag @s add gm4_turn_anticlockwise
execute if data storage gm4_better_armour_stands:data {pages:["turn right"]} run tag @s remove gm4_turn_clockwise
execute if data storage gm4_better_armour_stands:data {pages:["no turn"]} run tag @s remove gm4_turn_clockwise
execute if data storage gm4_better_armour_stands:data {pages:["no turn"]} run tag @s remove gm4_turn_anticlockwise
