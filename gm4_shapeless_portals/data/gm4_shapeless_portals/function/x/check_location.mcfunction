# check if new location is valid for a portal frame
# @s = new portal frame marker
# at potential new portal block
# run from x/flood_fill

tag @s remove gm4_sp_portal_check
execute unless predicate gm4_shapeless_portals:portal_validity_x run scoreboard players set $portal_blocks gm4_sp_data 9999
