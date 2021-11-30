# @s = armor_stand with no nearby tracked player
# at @s
# run from main

execute as @e[type=marker,tag=gm4_bas_marker] if score @s gm4_bas_id = @e[tag=gm4_bas_track,distance=..10,sort=nearest,limit=1] gm4_bas_id at @s run kill @s
execute as @e[type=wandering_trader,tag=gm4_bas_detect] if score @s gm4_bas_id = @e[tag=gm4_bas_track,distance=..10,sort=nearest,limit=1] gm4_bas_id at @s run tp @s ~ -10000 ~

function gm4_better_armour_stands:pose/track/clear
