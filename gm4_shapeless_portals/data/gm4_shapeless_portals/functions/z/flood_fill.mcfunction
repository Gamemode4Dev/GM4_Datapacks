# fill new blocks in portal frame
# @s = portal frame marker
# at @s
# run from portal_found
# run from here

scoreboard players add $portal_blocks gm4_sp_data 1
tag @s remove gm4_sp_portal_new

execute positioned ~ ~ ~1 if block ~ ~ ~ #gm4:air unless entity @e[type=marker,tag=gm4_sp_portal,distance=..0.5] run summon marker ~ ~ ~ {Tags:["gm4_sp_portal","gm4_sp_portal_new","gm4_sp_portal_check"]}
execute positioned ~ ~ ~-1 if block ~ ~ ~ #gm4:air unless entity @e[type=marker,tag=gm4_sp_portal,distance=..0.5] run summon marker ~ ~ ~ {Tags:["gm4_sp_portal","gm4_sp_portal_new","gm4_sp_portal_check"]}
execute positioned ~ ~1 ~ if block ~ ~ ~ #gm4:air unless entity @e[type=marker,tag=gm4_sp_portal,distance=..0.5] run summon marker ~ ~ ~ {Tags:["gm4_sp_portal","gm4_sp_portal_new","gm4_sp_portal_check"]}
execute positioned ~ ~-1 ~ if block ~ ~ ~ #gm4:air unless entity @e[type=marker,tag=gm4_sp_portal,distance=..0.5] run summon marker ~ ~ ~ {Tags:["gm4_sp_portal","gm4_sp_portal_new","gm4_sp_portal_check"]}

execute as @e[type=marker,tag=gm4_sp_portal_check] at @s run function gm4_shapeless_portals:z/check_location
execute if score $portal_blocks gm4_sp_data <= $max_portal_size gm4_sp_data as @e[type=marker,tag=gm4_sp_portal_new,limit=1] at @s run function gm4_shapeless_portals:z/flood_fill
execute if score $portal_blocks gm4_sp_data <= $max_portal_size gm4_sp_data unless entity @e[type=marker,tag=gm4_sp_portal_new] run function gm4_shapeless_portals:z/build
