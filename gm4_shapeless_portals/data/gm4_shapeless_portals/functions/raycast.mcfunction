# raycast to find fire block in portal frame
# @s = player that lit the portal
# at @s, raycasting forward
# run from portal_lit
# run from here

scoreboard players remove $raycast_limit gm4_sp_data 1

execute if block ~ ~ ~ fire if block ~ ~-1 ~ #gm4_shapeless_portals:portal_block run function gm4_shapeless_portals:portal_found
execute if score $raycast_limit gm4_sp_data matches 1.. positioned ~1 ~ ~ if block ~ ~ ~ fire if block ~ ~-1 ~ #gm4_shapeless_portals:portal_block run function gm4_shapeless_portals:portal_found
execute if score $raycast_limit gm4_sp_data matches 1.. positioned ~-1 ~ ~ if block ~ ~ ~ fire if block ~ ~-1 ~ #gm4_shapeless_portals:portal_block run function gm4_shapeless_portals:portal_found
execute if score $raycast_limit gm4_sp_data matches 1.. positioned ~ ~ ~1 if block ~ ~ ~ fire if block ~ ~-1 ~ #gm4_shapeless_portals:portal_block run function gm4_shapeless_portals:portal_found
execute if score $raycast_limit gm4_sp_data matches 1.. positioned ~ ~ ~-1 if block ~ ~ ~ fire if block ~ ~-1 ~ #gm4_shapeless_portals:portal_block run function gm4_shapeless_portals:portal_found
execute if score $raycast_limit gm4_sp_data matches 1.. positioned ~ ~1 ~ if block ~ ~ ~ fire if block ~ ~-1 ~ #gm4_shapeless_portals:portal_block run function gm4_shapeless_portals:portal_found
execute if score $raycast_limit gm4_sp_data matches 1.. positioned ~ ~-1 ~ if block ~ ~ ~ fire if block ~ ~-1 ~ #gm4_shapeless_portals:portal_block run function gm4_shapeless_portals:portal_found

execute if score $raycast_limit gm4_sp_data matches 1.. positioned ^ ^ ^0.5 run function gm4_shapeless_portals:raycast
