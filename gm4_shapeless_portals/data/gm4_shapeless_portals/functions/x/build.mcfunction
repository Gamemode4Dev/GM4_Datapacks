# fill in the portal frame
# @s = portal frame marker
# at @s
# run from x/flood_fill

execute at @e[type=marker,tag=gm4_sp_portal] run setblock ~ ~ ~ nether_portal[axis=x]
scoreboard players set $portal_blocks gm4_sp_data 9999
scoreboard players set $portal_build gm4_sp_data 1
