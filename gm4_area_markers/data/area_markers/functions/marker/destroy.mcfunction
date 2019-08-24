# @s = area marker AEC if empty item frame is nearby
# run from main

execute if entity @s[tag=gm4_am_tier_1] run data merge entity @e[type=item_frame,limit=1,sort=nearest,distance=..0.1] {Tags:["gm4_area_marker"],Item:{id:"minecraft:player_head",Count:1b,tag:{RepairCost:0,gm4_area_marker:1b,gm4_am_tier:1b,display:{Name:"{\"translate\":\"%1$s%3427655$s\",\"with\":[\"Area Marker Tier 1\",{\"translate\":\"item.gm4.area_markers.tier_1\"}],\"italic\":\"false\"}"},SkullOwner:{Id:"9b36c3fe-187f-4686-b472-4c7d7670804a",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNTJiNmZiMGRlYzgwMmJlMmJiYTQ4ODg2MDA5MDlkZGIxMzVhMGNlYjMzZWFmN2M0ZjI1NTNmNTE4Nzc2ZDlkZSJ9fX0="}]}}}}} 
execute if entity @s[tag=gm4_am_tier_2] run data merge entity @e[type=item_frame,limit=1,sort=nearest,distance=..0.1] {Tags:["gm4_area_marker"],Item:{id:"minecraft:player_head",Count:1b,tag:{RepairCost:0,gm4_area_marker:1b,gm4_am_tier:2b,display:{Name:"{\"translate\":\"%1$s%3427655$s\",\"with\":[\"Area Marker Tier 1\",{\"translate\":\"item.gm4.area_markers.tier_1\"}],\"italic\":\"false\"}"},SkullOwner:{Id:"68960c41-2c50-4ba4-8de0-665bae643405",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNmE3NzZlZjA0OTAxZDRkN2Y2Y2ZkMGU5MjdkNjQwNDFhY2M4NWUyNmRhYjU5MzZmODQ4Yjk2NTViNWQyNTdkZiJ9fX0="}]}}}}}
execute if entity @s[tag=gm4_am_tier_3] run data merge entity @e[type=item_frame,limit=1,sort=nearest,distance=..0.1] {Tags:["gm4_area_marker"],Item:{id:"minecraft:player_head",Count:1b,tag:{RepairCost:0,gm4_area_marker:1b,gm4_am_tier:3b,display:{Name:"{\"translate\":\"%1$s%3427655$s\",\"with\":[\"Area Marker Tier 1\",{\"translate\":\"item.gm4.area_markers.tier_1\"}],\"italic\":\"false\"}"},SkullOwner:{Id:"2c7ef02d-8016-4244-b484-dbdd31da8849",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNGE5NWRkYzBhMGI5YzI5ZjI0N2RmNzczZDBhNDM1YmY0ZDIxMTA1OTllNWU3MGNmYzdhMzJiMDQ2ZDdmYjljYiJ9fX0="}]}}}}}

#execute if entity @s[tag=gm4_am_tier_1] run say I am tier 1
#execute if entity @s[tag=gm4_am_tier_2] run say I am tier 2
#execute if entity @s[tag=gm4_am_tier_3] run say I am tier 3

data modify entity @e[type=item_frame,limit=1,sort=nearest,distance=..0.1] Item.tag.display.Name set from entity @s CustomName
particle minecraft:block stripped_birch_log ~ ~ ~ .2 .2 .2 .1 10
kill @s