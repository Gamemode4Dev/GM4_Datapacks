# @s = gm4_liquid_tank marker
# at center of block
# run by upgrade_paths/2.5

# replace primary armor stand with item display
summon item_display ~ ~0.4 ~ {Tags:["gm4_liquid_tank_display","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_liquid_tank_display"',item:{id:"glass",Count:1,tag:{CustomModelData:"block/liquid_tank"}},Rotation:[0.0f,0.0f],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.001f,0f],scale:[0.438,0.438,0.438]},item_display:head}
data modify entity @e[type=item_display,limit=1,distance=..1,tag=gm4_new_machine] Rotation set from entity @e[type=armor_stand,limit=1,distance=..1,tag=gm4_liquid_tank_stand] Rotation
kill @e[type=armor_stand,limit=1,distance=..1,tag=gm4_liquid_tank_stand]
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 2
tag @e[tag=gm4_new_machine,distance=..1] remove gm4_new_machine

# replace liquid armor stand with item display
execute at @e[type=armor_stand,limit=1,tag=gm4_liquid_tank_display,distance=..1] positioned ~ ~0.95 ~ run summon item_display ~ ~ ~ {CustomName:'"gm4_liquid_tank_liquid_display"',Tags:["gm4_liquid_tank_liquid_display","smithed.entity","smithed.strict","gm4_new_liquid"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.2185f,0f],scale:[0.83,0.83,0.83]},item_display:head}
data modify entity @e[type=item_display,tag=gm4_new_liquid,limit=1,distance=..1] item set from entity @e[type=armor_stand,limit=1,tag=gm4_liquid_tank_display,distance=..1] ArmorItems[3]
tag @e[type=item_display,tag=gm4_new_liquid] remove gm4_new_liquid
kill @e[type=armor_stand,limit=1,tag=gm4_liquid_tank_display,distance=..1]


scoreboard players set @s gm4_entity_version 2
