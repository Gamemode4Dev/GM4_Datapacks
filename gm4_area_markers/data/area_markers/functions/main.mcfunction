#run from pulse_check

#create marker
execute at @a as @e[type=item_frame,distance=..16,tag=!gm4_area_marker,nbt={Item:{tag:{gm4_area_marker:1b}}}] at @s positioned ^ ^ ^0.3 positioned ~ ~-.3 ~ unless entity @e[type=area_effect_cloud,tag=gm4_area_marker,distance=..0.1] run function area_markers:marker/create
tag @e[type=item_frame,nbt=!{Item:{tag:{gm4_area_marker:1b}}}] remove gm4_area_marker

#process marker
execute as @e[type=area_effect_cloud, tag=gm4_area_marker] run function area_markers:marker/process

#fix broken items
execute as @e[type=item,name="Player Head"] run function area_markers:process_item
