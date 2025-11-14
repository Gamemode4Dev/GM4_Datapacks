# custom placement
# @s = player who placed the furniture player head
# at the center of the placed block rotated along axis to face towards player or away from the wall
# run from place/furniture/metal_set/iron.spotlight (generated)

# set main display to base
data modify entity @n[type=item_display,tag=gm4_new_furniture,tag=gm4_furniture.display,limit=1,distance=..1] item.components merge value {"minecraft:item_model":"gm4_furniture:metal_set/iron/spotlight/default/base","custom_data":{gm4_furniture:{lit:1}}}

# summon additional displays
# | if not sneaking face player
execute unless predicate gm4_furniture:is_sneaking run summon item_display ~ ~0.0625 ~ {Tags:["gm4_furniture","gm4_furniture.additional_display","gm4_furniture.display_2","smithed.entity","smithed.strict","gm4_new_furniture"],CustomName:"gm4_furniture_display.metal_set.iron.spotlight_lamp",item:{id:"leather_horse_armor",count:1,components:{"minecraft:item_model":"gm4_furniture:metal_set/iron/spotlight/default/lamp"}},item_display:head,transformation:{left_rotation:[0.707f,0f,0f,0.707f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.0f,1.0f,1.0f]}}
execute unless predicate gm4_furniture:is_sneaking run summon item_display ~ ~0.0625 ~ {Tags:["gm4_furniture","gm4_furniture.additional_display","gm4_furniture.display_3","smithed.entity","smithed.strict","gm4_new_furniture"],CustomName:"gm4_furniture_display.metal_set.iron.spotlight_beam",item:{id:"leather_horse_armor",count:1,components:{"minecraft:item_model":"gm4_furniture:metal_set/iron/spotlight/default/beam"}},item_display:head,transformation:{left_rotation:[0.707f,0f,0f,0.707f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0.6875f],scale:[5.33f,5.33f,5.33f]}}
# | if sneaking face away from player
execute if predicate gm4_furniture:is_sneaking run summon item_display ~ ~0.0625 ~ {Tags:["gm4_furniture","gm4_furniture.additional_display","gm4_furniture.display_2","smithed.entity","smithed.strict","gm4_new_furniture"],CustomName:"gm4_furniture_display.metal_set.iron.spotlight_lamp",item:{id:"leather_horse_armor",count:1,components:{"minecraft:item_model":"gm4_furniture:metal_set/iron/spotlight/default/lamp"}},item_display:head,transformation:{left_rotation:[-0.707f,0f,0f,0.707f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.0f,1.0f,1.0f]}}
execute if predicate gm4_furniture:is_sneaking run summon item_display ~ ~0.0625 ~ {Tags:["gm4_furniture","gm4_furniture.additional_display","gm4_furniture.display_3","smithed.entity","smithed.strict","gm4_new_furniture"],CustomName:"gm4_furniture_display.metal_set.iron.spotlight_beam",item:{id:"leather_horse_armor",count:1,components:{"minecraft:item_model":"gm4_furniture:metal_set/iron/spotlight/default/beam"}},item_display:head,transformation:{left_rotation:[-0.707f,0f,0f,0.707f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,-0.6875f],scale:[5.33f,5.33f,5.33f]}}

# rotate
rotate @n[type=item_display,tag=gm4_furniture.display_2,tag=gm4_new_furniture,distance=..1] facing entity @s eyes
rotate @n[type=item_display,tag=gm4_furniture.display_3,tag=gm4_new_furniture,distance=..1] facing entity @s eyes
