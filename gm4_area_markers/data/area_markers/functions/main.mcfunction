#run from pulse_check

#create marker
execute as @e[type=item_frame,tag=!gm4_area_marker] if data entity @s {Item:{tag:{gm4_area_marker:1b}}} unless data entity @s {Item:{tag:{display:{Name:"{\"translate\":\"%1$s%3427655$s\",\"with\":[\"Area Marker Tier 1\",{\"translate\":\"item.gm4.area_markers.tier_1\"}],\"italic\":\"false\"}"}}}} unless data entity @s {Item:{tag:{display:{Name:"{\"translate\":\"%1$s%3427655$s\",\"with\":[\"Area Marker Tier 2\",{\"translate\":\"item.gm4.area_markers.tier_2\"}],\"italic\":\"false\"}"}}}} unless data entity @s {Item:{tag:{display:{Name:"{\"translate\":\"%1$s%3427655$s\",\"with\":[\"Area Marker Tier 3\",{\"translate\":\"item.gm4.area_markers.tier_3\"}],\"italic\":\"false\"}"}}}} at @s positioned ^ ^ ^0.3 positioned ~ ~-.3 ~ unless entity @e[type=area_effect_cloud,tag=gm4_area_marker,distance=..0.1] run function area_markers:marker/create
tag @e[type=item_frame,tag=gm4_area_marker,nbt=!{Item:{tag:{gm4_area_marker:1b}}}] remove gm4_area_marker

#process marker
execute as @e[type=area_effect_cloud, tag=gm4_area_marker] run function area_markers:marker/process

#fix broken items
execute as @e[type=item,name="Player Head"] run function area_markers:process_item