# @s = gm4_liquid_minecart cart
# at self
# run by upgrade_paths/1.8

# add new block offset data
data merge entity @s {DisplayOffset:1}

# replace armor stand with item display
summon item_display ~ ~ ~ {Tags:["gm4_liquid_minecart_display","gm4_machine_cart","smithed.entity","smithed.strict","gm4_new_machine"],item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$liquid_minecart_display/empty","minecraft:custom_data":{gm4_liquid_minecarts:{liquid_tag:"null"}}}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0,0.7275,0.0],scale:[0.83,0.83,0.83]},item_display:"head"}
data modify entity @e[tag=gm4_new_machine,distance=..2,limit=1] item.components."minecraft:custom_data".gm4_liquid_minecarts set from entity @e[type=armor_stand,limit=1,distance=..1,sort=nearest,tag=gm4_liquid_minecart_stand] equipment.feet
ride @e[tag=gm4_new_machine,tag=gm4_liquid_minecart_display,limit=1] mount @s
execute on passengers run kill @s[type=armor_stand,tag=gm4_liquid_minecart_stand]
tag @e[tag=gm4_new_machine,distance=..1] remove gm4_new_machine

scoreboard players set @s gm4_entity_version 2
