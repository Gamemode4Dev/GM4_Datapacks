
data modify entity @s equipment.body.components."minecraft:custom_data".gm4_horsemanship.glider.grounded set value 1
data modify entity @s equipment.body.components."minecraft:attribute_modifiers"[{"type":"minecraft:gravity","id":"gm4_horsemanship:horse_wings"}].amount set value 0
data modify entity @s equipment.body.components."minecraft:attribute_modifiers"[{"type":"minecraft:jump_strength","id":"gm4_horsemanship:horse_wings"}].amount set value 0
data modify entity @s equipment.body.components."minecraft:attribute_modifiers"[{"type":"minecraft:movement_speed","id":"gm4_horsemanship:horse_wings"}].amount set value 0
scoreboard players set $grounded gm4_horse_data 1
