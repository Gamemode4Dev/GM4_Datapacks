
scoreboard players set $raycast_limit gm4_sp_data 0

summon marker ~ ~ ~ {Tags:["gm4_sp_portal","gm4_sp_portal_origin"]}
setblock ~ ~ ~ air
execute as @e[type=marker,tag=gm4_sp_portal_origin] run function
