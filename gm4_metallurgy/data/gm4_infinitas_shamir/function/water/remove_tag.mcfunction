# Player no longer possessing any Infinitas Water Buckets
# @s = player
# at @s
# run from gm4_infinitas_shamir:water/check_inventory

tag @s remove gm4_has_water_infinitas
tag @s[tag=!gm4_has_empty_infinitas,tag=!gm4_has_lava_infinitas,tag=!gm4_has_powder_snow_infinitas] remove gm4_has_infinitas
advancement revoke @s only gm4_infinitas_shamir:bucket_inventory_change water_bucket
