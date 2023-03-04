# fill in the portal frame
# @s = portal frame marker
# at each portal block
# run from portal_found

execute at @e[type=marker,tag=gm4_sp_portal] run setblock ~ ~ ~ nether_portal[axis=z]
scoreboard players set $portal_build gm4_sp_data 1
