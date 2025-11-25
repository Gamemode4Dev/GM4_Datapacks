# set this gm4_horses as being on the ground
# @s = tamed gm4_horse
# at @s
# run from horse_processing/glider/process
# run from horse_processing/glider/unmounted

tag @s remove gm4_horse.gliding

data modify entity @s equipment.body.components."minecraft:equippable".asset_id set value "gm4_horsemanship:wings"
playsound item.armor.equip_elytra player @a ~ ~ ~ 1 1

data modify entity @s equipment.body.components."minecraft:custom_data".gm4_horsemanship.glider.grounded set value 1
data modify entity @s equipment.body.components."minecraft:attribute_modifiers"[{"type":"minecraft:gravity","id":"gm4_horsemanship:horse_wings"}].amount set value 0
data modify entity @s equipment.body.components."minecraft:attribute_modifiers"[{"type":"minecraft:jump_strength","id":"gm4_horsemanship:horse_wings"}].amount set value 0
data modify entity @s equipment.body.components."minecraft:attribute_modifiers"[{"type":"minecraft:movement_speed","id":"gm4_horsemanship:horse_wings"}].amount set value 0
scoreboard players set $grounded gm4_horse_data 1

execute on passengers run kill @s[type=item_display,tag=gm4_horse.glider_wing]
