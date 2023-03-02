# check a found possible portal frame
# @s = player lighting the portal
# at fire where portal was lit
# run from raycast

# stop raycast
scoreboard players set $raycast_limit gm4_sp_data 0

# create marker for origin of portal
kill @e[type=marker,tag=gm4_sp_portal]
summon marker ~ ~ ~ {Tags:["gm4_sp_portal","gm4_sp_portal_origin"]}
setblock ~ ~ ~ air

# try to fill x-axis portal
scoreboard players set $portal_blocks gm4_sp_data 0
scoreboard players set $portal_build gm4_sp_data 0
execute as @e[type=marker,tag=gm4_sp_portal_origin] at @s if predicate gm4_shapeless_portals:portal_validity_x run function gm4_shapeless_portals:x/flood_fill
execute if score $portal_blocks gm4_sp_data <= $max_portal_size gm4_sp_data run function gm4_shapeless_portals:x/build

# try to fill z-axis portal
kill @e[type=marker,tag=gm4_sp_portal,tag=!gm4_sp_portal_origin]
scoreboard players set $portal_blocks gm4_sp_data 0
execute if score $portal_build gm4_sp_data matches 0 as @e[type=marker,tag=gm4_sp_portal_origin] at @s if predicate gm4_shapeless_portals:portal_validity_z run function gm4_shapeless_portals:z/flood_fill
execute if score $portal_build gm4_sp_data matches 0 if score $portal_blocks gm4_sp_data <= $max_portal_size gm4_sp_data run function gm4_shapeless_portals:z/build

# if no portal can be made return fire
execute if score $portal_build gm4_sp_data matches 0 at @e[type=marker,tag=gm4_sp_portal_origin] run setblock ~ ~ ~ fire

kill @e[type=marker,tag=gm4_sp_portal]
