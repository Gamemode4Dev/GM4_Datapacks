# start raycast to find portal location
# @s = player that lit the portal
# at @s
advancement revoke @s only gm4_shapeless_portals:light_portal

scoreboard players set $raycast_limit gm4_sp_data 12
execute anchored eyes positioned ^ ^ ^0.5 run function gm4_shapeless_portals:raycast
