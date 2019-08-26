#called from main
#@s = Every player head item

data merge entity @s[nbt={Item:{tag:{SkullOwner:{Id:"9b36c3fe-187f-4686-b472-4c7d7670804a"}}}}] {Item:{tag:{RepairCost:0,gm4_area_marker:1b,gm4_am_tier:1b,display:{Name:"{\"translate\":\"%1$s%3427655$s\",\"with\":[\"Area Marker Tier 1\",{\"translate\":\"item.gm4.area_markers.tier_1\"}],\"italic\":\"false\"}"}}}}
data merge entity @s[nbt={Item:{tag:{SkullOwner:{Id:"68960c41-2c50-4ba4-8de0-665bae643405"}}}}] {Item:{tag:{RepairCost:0,gm4_area_marker:1b,gm4_am_tier:2b,display:{Name:"{\"translate\":\"%1$s%3427655$s\",\"with\":[\"Area Marker Tier 2\",{\"translate\":\"item.gm4.area_markers.tier_2\"}],\"italic\":\"false\"}"}}}}
execute as @s[nbt={Item:{tag:{SkullOwner:{Id:"2c7ef02d-8016-4244-b484-dbdd31da8849"}}}}] run data merge entity @s {Item:{tag:{RepairCost:0,gm4_area_marker:1b,gm4_am_tier:3b,display:{Name:"{\"translate\":\"%1$s%3427655$s\",\"with\":[\"Area Marker Tier 3\",{\"translate\":\"item.gm4.area_markers.tier_3\"}],\"italic\":\"false\"}"}}}}
