# @s = written book ..1 from armor_stand
execute if entity @s[nbt={Item:{tag:{pages:["default"]}}}] as @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] at @s run function gm4_better_armour_stands:default
execute if entity @s[nbt={Item:{tag:{pages:["no gravity"]}}}] run data merge entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] {NoGravity:1}
execute if entity @s[nbt={Item:{tag:{pages:["gravity"]}}}] run data merge entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] {NoGravity:0}
execute if entity @s[nbt={Item:{tag:{pages:["arms"]}}}] run data merge entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] {ShowArms:1}
execute if entity @s[nbt={Item:{tag:{pages:["arms"]}}}] if entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] run advancement grant @a[distance=..3,gamemode=!spectator] only gm4:better_armour_stands
execute if entity @s[nbt={Item:{tag:{pages:["no arms"]}}}] run data merge entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] {ShowArms:0}
execute if entity @s[nbt={Item:{tag:{pages:["small"]}}}] run data merge entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] {Small:1}
execute if entity @s[nbt={Item:{tag:{pages:["tall"]}}}] run data merge entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] {Small:0}
execute if entity @s[nbt={Item:{tag:{pages:["no base"]}}}] run data merge entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] {NoBasePlate:1}
execute if entity @s[nbt={Item:{tag:{pages:["base"]}}}] run data merge entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] {NoBasePlate:0}
execute if entity @s[nbt={Item:{tag:{pages:["invisible"]}}}] align xz as @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] run data merge entity @s {Invisible:1b}
execute if entity @s[nbt={Item:{tag:{pages:["visible"]}}}] align xz as @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] run data merge entity @s {Invisible:0}


execute if entity @s[nbt={Item:{tag:{pages:["turn left"]}}}] run tag @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] add gm4_turn_clockwise
execute if entity @s[nbt={Item:{tag:{pages:["turn left"]}}}] run tag @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] remove gm4_turn_anticlockwise
execute if entity @s[nbt={Item:{tag:{pages:["turn right"]}}}] run tag @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] add gm4_turn_anticlockwise
execute if entity @s[nbt={Item:{tag:{pages:["turn right"]}}}] run tag @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] remove gm4_turn_clockwise
execute if entity @s[nbt={Item:{tag:{pages:["no turn"]}}}] run tag @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] remove gm4_turn_clockwise
execute if entity @s[nbt={Item:{tag:{pages:["no turn"]}}}] run tag @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] remove gm4_turn_anticlockwise

tag @s add gm4_as_book
execute if entity @s[nbt={Item:{tag:{pages:["equip head"]}}}] as @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] at @s unless data entity @s ArmorItems[3].Count run function gm4_better_armour_stands:equip/head
execute if entity @s[nbt={Item:{tag:{pages:["equip hand"]}}}] as @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] at @s unless data entity @s HandItems[0].Count run function gm4_better_armour_stands:equip/hand
execute if entity @s[nbt={Item:{tag:{pages:["equip offhand"]}}}] as @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit,sort=nearest] at @s unless data entity @s HandItems[1].Count run function gm4_better_armour_stands:equip/offhand
