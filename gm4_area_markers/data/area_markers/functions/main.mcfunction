#run from pulse_check

#remove marker
execute as @e[type=area_effect_cloud,tag=gm4_area_marker] at @s positioned ^ ^ ^-0.3 positioned ~ ~.3 ~ if entity @e[type=item_frame,nbt=!{Item:{}},distance=..0.1,limit=1] run function area_markers:marker/destroy

#create marker
execute as @e[type=item_frame,tag=!gm4_area_marker] if data entity @s {Item:{tag:{gm4_area_marker:1b}}} unless data entity @s {Item:{tag:{display:{Name:"{\"translate\":\"%1$s%3427655$s\",\"with\":[\"Area Marker Tier 1\",{\"translate\":\"item.gm4.area_markers.tier_1\"}],\"italic\":\"false\"}"}}}} unless data entity @s {Item:{tag:{display:{Name:"{\"translate\":\"%1$s%3427655$s\",\"with\":[\"Area Marker Tier 2\",{\"translate\":\"item.gm4.area_markers.tier_2\"}],\"italic\":\"false\"}"}}}} unless data entity @s {Item:{tag:{display:{Name:"{\"translate\":\"%1$s%3427655$s\",\"with\":[\"Area Marker Tier 3\",{\"translate\":\"item.gm4.area_markers.tier_3\"}],\"italic\":\"false\"}"}}}} at @s positioned ^ ^ ^0.3 positioned ~ ~-.3 ~ unless entity @e[type=area_effect_cloud,tag=gm4_area_marker,distance=..0.1] run function area_markers:marker/create
tag @e[type=item_frame,tag=gm4_area_marker,nbt=!{Item:{tag:{gm4_area_marker:1b}}}] remove gm4_area_marker

#make message apear in area
execute as @e[type=area_effect_cloud, tag=gm4_am_tier_1] at @s positioned ~-24 0 ~-24 run title @a[dx=48, dy=1000000000000, dz=48] actionbar [{"translate":"%1$s%3427655$s","with":["Area: ",{"translate":"text.gm4.area_markers.area"}],"color":"gold"},{"selector":"@s","color":"white"}]
execute as @e[type=area_effect_cloud, tag=gm4_am_tier_2] at @s positioned ~-48 0 ~-48 run title @a[dx=96, dy=1000000000000, dz=96] actionbar [{"translate":"%1$s%3427655$s","with":["Area: ",{"translate":"text.gm4.area_markers.area"}],"color":"gold"},{"selector":"@s","color":"white"}]
execute as @e[type=area_effect_cloud, tag=gm4_am_tier_3] at @s positioned ~-96 0 ~-96 run title @a[dx=192, dy=1000000000000, dz=192] actionbar [{"translate":"%1$s%3427655$s","with":["Area: ",{"translate":"text.gm4.area_markers.area"}],"color":"gold"},{"selector":"@s","color":"white"}]


#fix broken items
execute as @e[type=item,name="Player Head"] run function area_markers:process_item