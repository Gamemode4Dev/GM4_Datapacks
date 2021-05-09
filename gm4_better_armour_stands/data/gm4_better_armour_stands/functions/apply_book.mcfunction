# @s = armor_stand to be modified

# Restore armor stand state to default.
execute if data storage gm4_better_armour_stands:temp {pages:["default"]} run function gm4_better_armour_stands:default

# Toggle armor stand gravity.
execute if data storage gm4_better_armour_stands:temp {pages:["no gravity"]} run data merge entity @s {NoGravity:1}
execute if data storage gm4_better_armour_stands:temp {pages:["gravity"]} run data merge entity @s {NoGravity:0}

# Toggle armor stand arms.
execute if data storage gm4_better_armour_stands:temp {pages:["arms"]} run data merge entity @s {ShowArms:1}
execute if data storage gm4_better_armour_stands:temp {pages:["arms"]} if entity @s run advancement grant @a[distance=..3,gamemode=!spectator] only gm4:better_armour_stands
execute if data storage gm4_better_armour_stands:temp {pages:["no arms"]} run data merge entity @s {ShowArms:0}

# Toggle armor stand height.
execute if data storage gm4_better_armour_stands:temp {pages:["small"]} run data merge entity @s {Small:1}
execute if data storage gm4_better_armour_stands:temp {pages:["tall"]} run data merge entity @s {Small:0}

# Toggle armor stand base.
execute if data storage gm4_better_armour_stands:temp {pages:["no base"]} run data merge entity @s {NoBasePlate:1}
execute if data storage gm4_better_armour_stands:temp {pages:["base"]} run data merge entity @s {NoBasePlate:0}

# Toggle armor stand visibility.
execute if data storage gm4_better_armour_stands:temp {pages:["invisible"]} align xz as @s run data merge entity @s {Invisible:1b}
execute if data storage gm4_better_armour_stands:temp {pages:["visible"]} align xz as @s run data merge entity @s {Invisible:0b}

# Rotate the armor stand by predefined intervals.
execute if data storage gm4_better_armour_stands:temp {pages:["turn left"]} run tag @s add gm4_turn_clockwise
execute if data storage gm4_better_armour_stands:temp {pages:["turn left"]} run tag @s remove gm4_turn_anticlockwise
execute if data storage gm4_better_armour_stands:temp {pages:["turn right"]} run tag @s add gm4_turn_anticlockwise
execute if data storage gm4_better_armour_stands:temp {pages:["turn right"]} run tag @s remove gm4_turn_clockwise
execute if data storage gm4_better_armour_stands:temp {pages:["no turn"]} run tag @s remove gm4_turn_clockwise
execute if data storage gm4_better_armour_stands:temp {pages:["no turn"]} run tag @s remove gm4_turn_anticlockwise

# Equip dropped item into specified slot even if this is normally impossible.
execute if data storage gm4_better_armour_stands:temp {pages:["equip head"]} unless data entity @s ArmorItems[3].Count run function gm4_better_armour_stands:equip/head
execute if data storage gm4_better_armour_stands:temp {pages:["equip hand"]} unless data entity @s HandItems[0].Count run function gm4_better_armour_stands:equip/hand
execute if data storage gm4_better_armour_stands:temp {pages:["equip offhand"]} unless data entity @s HandItems[1].Count run function gm4_better_armour_stands:equip/offhand
